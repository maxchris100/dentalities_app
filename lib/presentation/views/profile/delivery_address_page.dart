import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/domain/repositories/profile_repository.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  State<DeliveryAddressPage> createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final int selectedIndex = 0; // buat pakai Cubit/State

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      HomeCubit hc = context.read<HomeCubit>();
      await hc.fetchProfile();
      setState(() {});
    });
  }

  Future onDelete(id) async {
    var res = await ProfileRepository.deleteAddress(userAddressId: id);

    HomeCubit homeCubit = context.read<HomeCubit>();
    await homeCubit.fetchProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ButtonBack(),
        // leadingWidth: 40,
        // centerTitle: true,
        title: const Text(
          "Delivery address",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.blue)),
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.deliveryAddressAdd,
                    arguments: {});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  SizedBox(width: 12),
                  const Text(
                    "New Address",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
                children:
                    (Constant.userLocalDataSource.userData?.userAddresses ?? [])
                        .asMap()
                        .entries
                        .map((e) {
              return _AddressCard(
                id: e.value.id,
                isSelected: e.key == 0,
                icon: "assets/icons/address_office.svg",
                title: e.value.firstName ?? "",
                address: e.value.address,
                addressDetail: e.value.getShippingAddress(),
                // e.value.provinceName +
                //     ', ' +
                //     e.value.cityName +
                //     ', ' +
                //     e.value.districtName +
                //     ', ' +
                //     e.value.postcode,
                onEdit: () async {
                  var res = await Navigator.pushNamed(
                      context, AppRouter.deliveryAddressAdd,
                      arguments: {"address": e.value});
                  if (res is Map?) {
                    if (res?["action"] == "delete") {
                      onDelete(res?["id"]);
                    }
                  } else {
                    HomeCubit homeCubit = context.read<HomeCubit>();
                    await homeCubit.fetchProfile();
                  }
                },
                onDelete: (id) {
                  onDelete(id);
                },
              );
            }).toList()),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final int id;
  final bool isSelected;
  final String icon;
  final String title;
  final String address;
  final String addressDetail;
  final VoidCallback onEdit;
  final Function(int id) onDelete;

  const _AddressCard({
    required this.id,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.address,
    required this.addressDetail,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? Color(0xffE3F1FB) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 1.2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(width: 12),
            // SvgPicture.asset(icon, height: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Address",
                      style: TextStyle(fontSize: 10, color: Colors.black)),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(addressDetail,
                      style: const TextStyle(color: Colors.black)),
                  Text(address, style: const TextStyle(color: Colors.black)),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onEdit,
                        child: const Text(
                          "Edit Address",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     onDelete(id);
                      //   },
                      //   child: const Text(
                      //     "Delete Address",
                      //     style: TextStyle(color: Colors.red),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Colors.blue,
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     SizedBox(
            //       height: 8,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         onDelete(id);
            //       },
            //       child: const Text(
            //         "Delete",
            //         style: TextStyle(color: Colors.red),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
