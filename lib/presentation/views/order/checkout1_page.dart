import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  bool isProcessing = false;
  UserAddress? selectedAddress;
  @override
  void initState() {
    super.initState();
  }

  void submitCheckout() async {
    setState(() => isProcessing = true);

    await Future.delayed(const Duration(seconds: 1));

    // CartCubit cartCubit = context.read<CartCubit>();
    // await cartCubit.checkoutCart(selectedAddress?.id);
    setState(() => isProcessing = false);
    Navigator.pushNamed(context, AppRouter.paymentComplete);
  }

  String getShippingAddress() {
    try {
      selectedAddress =
          Constant.userLocalDataSource.userData?.userAddresses?.first;
      String address = (selectedAddress?.provinceName ?? "") +
          ", " +
          (selectedAddress?.cityName ?? "") +
          ", " +
          (selectedAddress?.districtName ?? "") +
          ", " +
          (selectedAddress?.villageName ?? "") +
          ", " +
          (selectedAddress?.postcode ?? "") +
          ", " +
          (selectedAddress?.address ?? "");
      return address;
    } catch (e) {
      return "";
    }
  }

  String shipmentPrice = StringUtil.formatMoney(0);
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;
    String totalPrice = args?["total"] ?? "";
    String grandTotalPrice = args?["grand_total"] ?? "";
    String totalDiscount = args?["discount"] ?? "";
    int totalItem = args?["total_item"] ?? 0;
    Map<int, CartItem>? selectedCartItem = args?["selected_cart"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Shipping Address
                          const Text('Shipping Address',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                            getShippingAddress(),
                          ),
                          const SizedBox(height: 16),
                          const Divider(),

                          // Shipment
                          const SizedBox(height: 16),
                          Text('Shipment',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            subtitle:
                                const Text('JTR > 130\nEstimated 3-4 days'),
                            leading: Image.asset(
                              'assets/images/banner.png',
                              height: 40,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (_) {
                                return Container();
                              },
                            ),
                          ),

                          const Divider(),

                          // Payment Method
                          const SizedBox(height: 16),
                          Text('Payment Method',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            subtitle: const Text('Transfer to BCA'),
                            leading: Image.asset('assets/images/banner.png',
                                height: 40, width: 50, fit: BoxFit.cover),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (_) {
                                return Container();
                              },
                            ),
                          ),

                          const Divider(),

                          // Payment Summary
                          const SizedBox(height: 16),
                          const Text('Payment Summary',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Product ($totalItem ${totalItem > 1 ? "items" : "item"})'),
                              Text(totalPrice)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Shipment'), Text(shipmentPrice)],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount',
                                  style: TextStyle(color: Colors.red)),
                              Text(totalDiscount,
                                  style: TextStyle(color: Colors.red))
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(grandTotalPrice,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            submitCheckout();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: isProcessing
                              ? CircularProgressIndicator()
                              : const Text('Pay',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Continue with payment means you accept ",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11)),
                            TextSpan(
                                text: "our Terms and Conditions",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 11))
                          ])),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isProcessing)
              Positioned.fill(
                child: Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 24),
                        const Text(
                          "Processing Your Order",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Hang tight! We're confirming your payment and getting things ready. This won't take long",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
