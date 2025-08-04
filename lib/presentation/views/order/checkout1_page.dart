import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/delivery_method_model.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  bool isProcessing = false;
  UserAddress? selectedAddress;
  DeliveryMethod? selectedDeliveryMethod;
  dynamic selectedPaymentMethod;

  late CartCubit cartCubit;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;

      selectedAddress =
          Constant.userLocalDataSource.userData?.userAddresses?.first;
      cartCubit = context.read<CartCubit>();
      await cartCubit.getDeliveryMethod(selectedAddress?.id);

      setState(() {});
    });
  }

  void submitCheckout() async {
    setState(() => isProcessing = true);

    // await Future.delayed(const Duration(seconds: 1));

    // CartCubit cartCubit = context.read<CartCubit>();
    var res = await cartCubit.checkoutCart(
        selectedAddress?.id, selectedDeliveryMethod?.serviceCode);
    setState(() => isProcessing = false);
    if (res["status"]) {
      Navigator.pushNamed(context, AppRouter.orderPayment,
          arguments: {"item": res["data"]});
    } else {
      ToastUtil.showToastError("", res["message"]);
    }
  }

  String shipmentPrice = "0";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;
    String totalPrice = args?["total"] ?? "0";
    String grandTotalPrice = args?["grand_total"] ?? "0";
    String totalDiscount = args?["discount"] ?? "0";
    int totalItem = args?["total_item"] ?? 0;

    String grandGrandTotalPrice = StringUtil.formatMoney(
        int.parse(grandTotalPrice) + int.parse(shipmentPrice));
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(Constant.userLocalDataSource.userData
                                            ?.phone ??
                                        ""),
                                    Text(Constant.userLocalDataSource.userData
                                            ?.email ??
                                        ""),
                                    Text(
                                      selectedAddress?.getShippingAddress() ??
                                          "",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      builder: (_) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Select Shipment Address",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Flexible(
                                                child: ListView.separated(
                                                  itemCount: (Constant
                                                              .userLocalDataSource
                                                              .userData
                                                              ?.userAddresses ??
                                                          [])
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var e = Constant
                                                        .userLocalDataSource
                                                        .userData
                                                        ?.userAddresses?[index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedAddress = e;
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              child: Text(e!
                                                                  .getShippingAddress()),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return Divider();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Change",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Divider(),

                          // Shipment
                          const SizedBox(height: 16),
                          Text('Shipment',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(selectedDeliveryMethod != null
                                ? '${selectedDeliveryMethod?.serviceDisplay}'
                                : "Select Delivery Method"),
                            subtitle: selectedDeliveryMethod != null
                                ? Text(selectedDeliveryMethod != null
                                    ? '${StringUtil.formatMoney(selectedDeliveryMethod?.price)}'
                                    : "")
                                : null,
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
                                return Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Select Delivery Method",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Flexible(
                                        child: ListView.separated(
                                          itemCount:
                                              (cartCubit.data.deliveryMethod)
                                                  .length,
                                          itemBuilder: (context, index) {
                                            var e = cartCubit
                                                .data.deliveryMethod[index];
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedDeliveryMethod = e;
                                                  shipmentPrice =
                                                      e.price ?? "0";
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                          e.serviceDisplay ??
                                                              ""),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(StringUtil.formatMoney(
                                                      e.price))
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          const Divider(),

                          // Payment Method
                          // const SizedBox(height: 16),
                          // Text('Payment Method',
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          // ListTile(
                          //   contentPadding: EdgeInsets.zero,
                          //   title: Text(selectedPaymentMethod != null
                          //       ? "Transfer BCA"
                          //       : "Select Payment Method"),
                          //   leading: Image.asset('assets/images/banner.png',
                          //       height: 40, width: 50, fit: BoxFit.cover),
                          //   trailing: const Icon(Icons.chevron_right),
                          //   onTap: () => showModalBottomSheet(
                          //     context: context,
                          //     shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //             top: Radius.circular(20))),
                          //     builder: (_) {
                          //       return Container();
                          //     },
                          //   ),
                          // ),

                          // const Divider(),

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
                              Text(StringUtil.formatMoney(totalPrice))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipment'),
                              Text(StringUtil.formatMoney(shipmentPrice))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount',
                                  style: TextStyle(color: Colors.red)),
                              Text(StringUtil.formatMoney(totalDiscount),
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
                              Text(grandGrandTotalPrice,
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
