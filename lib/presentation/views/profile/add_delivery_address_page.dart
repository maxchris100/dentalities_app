import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/domain/repositories/profile_repository.dart';
import 'package:dentalities/presentation/blocs/cubit/delivery_address_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/widgets/search_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditDeliveryAddressPage extends StatefulWidget {
  const AddEditDeliveryAddressPage({super.key});

  @override
  State<AddEditDeliveryAddressPage> createState() =>
      _AddEditDeliveryAddressPageState();
}

class _AddEditDeliveryAddressPageState
    extends State<AddEditDeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController labelCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController postalCodeCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();

  bool isLoading = false;
  bool onSubmit = false;

  DeliveryAddressCubit deliveryAddressCubit = DeliveryAddressCubit();
  UserAddress? address;

  bool get isEdit => address != null;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args?["address"] != null) {
        address = args?["address"];

        loadData(address);
      } else {
        deliveryAddressCubit.loadProvinces();
      }
      setState(() {});
    });
  }

  Future loadData(UserAddress? address) async {
    try {
      postalCodeCtrl.text = address?.postcode ?? "";
      addressCtrl.text = address?.address ?? "";

      await deliveryAddressCubit.loadProvinces();
      var provinceId = deliveryAddressCubit.state.provinces
          .where((x) => x["name"] == address?.provinceName)
          .first["id"];
      await deliveryAddressCubit
          .selectProvince({"id": provinceId, "name": address?.provinceName});

      var cityId = deliveryAddressCubit.state.cities
          .where((x) => x["name"] == address?.cityName)
          .first["id"];
      await deliveryAddressCubit
          .selectCity({"id": cityId, "name": address?.cityName});

      var districtId = deliveryAddressCubit.state.districts
          .where((x) => x["name"] == address?.districtName)
          .first["id"];
      await deliveryAddressCubit
          .selectDistrict({"id": districtId, "name": address?.districtName});

      var subdistrictId = deliveryAddressCubit.state.subdistricts
          .where((x) => x["name"] == address?.villageName)
          .first["id"];
      deliveryAddressCubit.selectSubdistrict(
          {"id": subdistrictId, "name": address?.villageName});
    } catch (e) {
      print("@Error Load Data");
    }
  }

  Future<void> handleSubmit() async {
    setState(() => onSubmit = true);
    if (!_formKey.currentState!.validate()) return;

    final selected = deliveryAddressCubit.state;
    if (selected.selectedProvinceId == null ||
        selected.selectedCityId == null ||
        selected.selectedDistrictId == null ||
        selected.selectedSubdistrictId == null) return;

    setState(() => isLoading = true);

    try {
      final payload = {
        "label": labelCtrl.text.trim(),
        "phone": phoneCtrl.text.trim(),
        "fullName": "",
        "provinceId": selected.selectedProvinceId!["id"].toString(),
        "cityId": selected.selectedCityId!["id"].toString(),
        "districtId": selected.selectedDistrictId!["id"].toString(),
        "subdistrictId": selected.selectedSubdistrictId!["id"].toString(),
        "postalCode": postalCodeCtrl.text.trim(),
        "address": addressCtrl.text.trim(),
      };
      var res;
      if (isEdit) {
        res = await ProfileRepository.updateAddress(
          userAddressId: address!.id,
          label: payload["label"]!,
          phone: payload["phone"]!,
          fullName: payload["label"]!,
          provinceId: payload["provinceId"]!,
          cityId: payload["cityId"]!,
          districtId: payload["districtId"]!,
          subdistrictId: payload["subdistrictId"]!,
          postalCode: payload["postalCode"]!,
          address: payload["address"]!,
        );
      } else {
        res = await ProfileRepository.addAddress(
          label: payload["label"]!,
          phone: payload["phone"]!,
          fullName: payload["label"]!,
          provinceId: payload["provinceId"]!,
          cityId: payload["cityId"]!,
          districtId: payload["districtId"]!,
          subdistrictId: payload["subdistrictId"]!,
          postalCode: payload["postalCode"]!,
          address: payload["address"]!,
        );
      }

      HomeCubit homeCubit = context.read<HomeCubit>();
      await homeCubit.fetchProfile();

      Navigator.pop(context, {"refresh": 1});
    } catch (e) {
      ToastUtil.showToastError("", "$e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    postalCodeCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeliveryAddressCubit>(
          create: (context) => deliveryAddressCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? "Edit Address" : "Add Address"),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Visibility(
              visible: isEdit,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 32,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Delete Address?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                  "Are you sure to delete this address? This action can’t be undone."),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: BorderSide(
                                              color: Colors.grey[300]!,
                                              strokeAlign: 2)),
                                      backgroundColor: Colors.white),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context, {
                                      "action": "delete",
                                      "id": address?.id
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
                bloc: deliveryAddressCubit,
                builder: (context, state) {
                  return ListView(
                    children: [
                      // const Text("Address",
                      //     style:
                      //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      // const SizedBox(height: 16),
                      const Text("Address Label"),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: labelCtrl,
                        maxLength: 8,
                        decoration: InputDecoration(
                            hintText: 'Address Label',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            counterText: ''),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Address Label is required'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      const Text("Phone"),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: phoneCtrl,
                        keyboardType: TextInputType.number,
                        maxLength: 13,
                        decoration: InputDecoration(
                            hintText: 'Phone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            counterText: ''),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Phone is required'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      // const Text("Email"),
                      // const SizedBox(height: 8),
                      // TextFormField(
                      //   controller: postalCodeCtrl,
                      //   keyboardType: TextInputType.number,
                      //   maxLength: 8,
                      //   decoration: InputDecoration(
                      //       hintText: 'Postal Code',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       counterText: ''),
                      //   validator: (value) => value == null || value.isEmpty
                      //       ? 'Postal Code is required'
                      //       : null,
                      // ),
                      // const SizedBox(height: 12),

                      const Text("Province"),
                      const SizedBox(height: 8),
                      BottomSheetSelector<Map>(
                        label: "Province",
                        selectedValue: state.selectedProvinceId?["name"],
                        items: state.provinces.map((e) => e as Map).toList(),
                        itemLabel: (p0) => p0["name"],
                        onSelected: (value) =>
                            deliveryAddressCubit.selectProvince(value),
                      ),
                      if (onSubmit && state.selectedProvinceId == null)
                        const Text("Province is required",
                            style: TextStyle(color: Colors.red)),
                      const SizedBox(height: 12),
                      const Text("City/Regency"),
                      const SizedBox(height: 8),
                      BottomSheetSelector<Map>(
                        label: "City/Regency",
                        selectedValue: state.selectedCityId?["name"],
                        items: state.cities.map((e) => e as Map).toList(),
                        itemLabel: (p0) => p0["name"],
                        onSelected: (value) =>
                            deliveryAddressCubit.selectCity(value),
                      ),
                      if (onSubmit && state.selectedCityId == null)
                        const Text("City/Regency is required",
                            style: TextStyle(color: Colors.red)),
                      const SizedBox(height: 12),
                      const Text("District"),
                      const SizedBox(height: 8),
                      BottomSheetSelector<Map>(
                        label: "District",
                        selectedValue: state.selectedDistrictId?["name"],
                        items: state.districts.map((e) => e as Map).toList(),
                        itemLabel: (p0) => p0["name"],
                        onSelected: (value) =>
                            deliveryAddressCubit.selectDistrict(value),
                      ),
                      if (onSubmit && state.selectedDistrictId == null)
                        const Text("District is required",
                            style: TextStyle(color: Colors.red)),
                      const SizedBox(height: 12),
                      const Text("Sub-district/Village"),
                      const SizedBox(height: 8),
                      BottomSheetSelector<Map>(
                        label: "Sub-district/Village",
                        selectedValue: state.selectedSubdistrictId?["name"],
                        items: state.subdistricts.map((e) => e as Map).toList(),
                        itemLabel: (p0) => p0["name"],
                        onSelected: (value) =>
                            deliveryAddressCubit.selectSubdistrict(value),
                      ),
                      if (onSubmit && state.selectedSubdistrictId == null)
                        const Text("Sub-district/Village is required",
                            style: TextStyle(color: Colors.red)),
                      const SizedBox(height: 12),
                      const Text("Postal Code"),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: postalCodeCtrl,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        decoration: InputDecoration(
                            hintText: 'Postal Code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            counterText: ''),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Postal Code is required'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      const Text("Full Address"),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: addressCtrl,
                        maxLines: 2,
                        maxLength: 300,
                        decoration: InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            counter: Text("")),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Address is required'
                            : null,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: isLoading ? null : handleSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: Text(
                          isLoading
                              ? "Please wait..."
                              : (isEdit ? "Update Address" : "Add Address"),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
