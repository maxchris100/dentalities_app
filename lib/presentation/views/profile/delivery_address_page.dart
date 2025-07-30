import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // HomeCubit hc = context.read<HomeCubit>();
      // hc.fetchProfile();
    });
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
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
                children:
                    (Constant.userLocalDataSource.userData?.userAddresses ?? [])
                        .asMap()
                        .entries
                        .map((e) {
              return _AddressCard(
                isSelected: e.key == 0,
                icon: "assets/icons/address_office.svg",
                title: e.value.firstName ?? "",
                address: e.value.address,
                addressDetail: e.value.provinceName +
                    ', ' +
                    e.value.cityName +
                    ', ' +
                    e.value.districtName +
                    ', ' +
                    e.value.postcode,
                onEdit: () {
                  Navigator.pushNamed(context, AppRouter.deliveryAddressAdd,
                      arguments: {"address": e.value});
                },
              );
            }).toList()),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.deliveryAddressAdd,
                    arguments: {});
              },
              child: const Text(
                "Add new address",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final bool isSelected;
  final String icon;
  final String title;
  final String address;
  final String addressDetail;
  final VoidCallback onEdit;

  const _AddressCard({
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.address,
    required this.addressDetail,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Colors.blue,
            ),
            // const SizedBox(width: 12),
            // SvgPicture.asset(icon, height: 36),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Address",
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(addressDetail,
                      style: const TextStyle(color: Colors.grey)),
                  Text(address, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            TextButton(
              onPressed: onEdit,
              child: const Text(
                "Edit",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
