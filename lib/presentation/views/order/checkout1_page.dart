import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/delivery_method_model.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
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

  CartCubit cartCubit = CartCubit();
  ProfileCubit profileCubit = ProfileCubit();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      await profileCubit.fetchProfileData();

      selectedAddress =
          Constant.userLocalDataSource.userData?.userAddresses?.first;
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
      ToastUtil.showToast("", res["message"]);
      Transaction item = Transaction.fromJson(res["data"]);
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.home,
        (route) => false,
      );

      Future.delayed(Duration(milliseconds: 50), () {
        Navigator.of(context).pushNamed(
          AppRouter.orderDetail,
          arguments: {"item": item},
        );
      });
      // Navigator.pushNamed(context, AppRouter.orderDetail,
      //     arguments: {"item": item});
      // Navigator.pushNamed(context, AppRouter.orderPayment,
      //     arguments: {"item": res["data"]});
    } else {
      ToastUtil.showToastError("", res["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;
    String totalPrice = args?["total"] ?? "0";
    String grandTotalPrice = args?["grand_total"] ?? "0";
    String totalDiscount = args?["discount"] ?? "0";
    int totalItem = args?["total_item"] ?? 0;

    String grandGrandTotalPrice = StringUtil.formatMoney(
        int.parse(grandTotalPrice) +
            int.parse(selectedDeliveryMethod?.price ?? "0"));
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
                                        UserAddress? tmpSelectedAddressMethod =
                                            selectedAddress;
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            final addresses = Constant
                                                    .userLocalDataSource
                                                    .userData
                                                    ?.userAddresses ??
                                                [];

                                            return Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    "Shipping Address",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  Flexible(
                                                    child: ListView.separated(
                                                      itemCount:
                                                          addresses.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final e =
                                                            addresses[index];
                                                        return RadioListTile<
                                                            UserAddress>(
                                                          value: e,
                                                          groupValue:
                                                              tmpSelectedAddressMethod,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              tmpSelectedAddressMethod =
                                                                  value;
                                                            });
                                                          },
                                                          dense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(0,
                                                                      0, 0, 0),
                                                          activeColor:
                                                              Colors.blue,
                                                          title: Text(
                                                            e.getShippingAddress(),
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing, // 🔹 radio di kanan
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const Divider(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed:
                                                          tmpSelectedAddressMethod ==
                                                                  null
                                                              ? null
                                                              : () {
                                                                  setState(() {
                                                                    selectedAddress =
                                                                        tmpSelectedAddressMethod;
                                                                  });
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.blue,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Apply',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
                              title: Text(
                                selectedDeliveryMethod != null
                                    ? '${selectedDeliveryMethod?.serviceDisplay}'
                                    : "Select Delivery Method",
                                style: TextStyle(fontSize: 14),
                              ),
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
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) {
                                    DeliveryMethod? tmpSelectedDeliveryMethod =
                                        selectedDeliveryMethod;

                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        final deliveryMethods =
                                            cartCubit.data.deliveryMethod;

                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                "Shipment",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 12),
                                              Flexible(
                                                child: ListView.separated(
                                                  itemCount:
                                                      deliveryMethods.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final e =
                                                        deliveryMethods[index];
                                                    return RadioListTile<
                                                        DeliveryMethod>(
                                                      value: e,
                                                      groupValue:
                                                          tmpSelectedDeliveryMethod,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          tmpSelectedDeliveryMethod =
                                                              value;
                                                        });
                                                      },
                                                      activeColor: Colors.blue,
                                                      dense: true,
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 0),
                                                      title: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              e.serviceDisplay ??
                                                                  "",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 12),
                                                          Text(StringUtil
                                                              .formatMoney(
                                                                  e.price)),
                                                        ],
                                                      ),
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing, // 🔹 radio di kanan
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const Divider(),
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed:
                                                      tmpSelectedDeliveryMethod ==
                                                              null
                                                          ? null
                                                          : () {
                                                              setState(() {
                                                                selectedDeliveryMethod =
                                                                    tmpSelectedDeliveryMethod;
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Apply',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }),

                          const Divider(),

                          // Payment Method
                          // const SizedBox(height: 16),
                          // Text('Payment Method',
                          //     style: TextStyle(fontWeight: FontWeight.bold)),
                          // ListTile(
                          //     contentPadding: EdgeInsets.zero,
                          //     title: Text(selectedPaymentMethod != null
                          //         ? "Transfer BCA"
                          //         : "Select Payment Method"),
                          //     leading: Image.asset('assets/images/banner.png',
                          //         height: 40, width: 50, fit: BoxFit.cover),
                          //     trailing: const Icon(Icons.chevron_right),
                          //     onTap: () {
                          //       PaymentMethod? tmpSelectedPaymentMethod =
                          //           selectedPaymentMethod;

                          //       showModalBottomSheet(
                          //         context: context,
                          //         shape: const RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.vertical(
                          //               top: Radius.circular(20)),
                          //         ),
                          //         builder: (_) {
                          //           return StatefulBuilder(
                          //             builder: (context, setState) {
                          //               return Padding(
                          //                 padding: const EdgeInsets.all(16),
                          //                 child: Column(
                          //                   mainAxisSize: MainAxisSize.min,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     const Text(
                          //                       "Select Payment Method",
                          //                       style: TextStyle(
                          //                           fontWeight:
                          //                               FontWeight.bold),
                          //                     ),
                          //                     const SizedBox(height: 12),
                          //                     Flexible(
                          //                       child: ListView.separated(
                          //                         itemCount:
                          //                             paymentMethods.length,
                          //                         itemBuilder:
                          //                             (context, index) {
                          //                           final e =
                          //                               paymentMethods[index];
                          //                           return RadioListTile<
                          //                               PaymentMethod>(
                          //                             value: e,
                          //                             groupValue:
                          //                                 tmpSelectedPaymentMethod,
                          //                             onChanged: (value) {
                          //                               setState(() {
                          //                                 tmpSelectedPaymentMethod =
                          //                                     value;
                          //                               });
                          //                             },
                          //                             title: Row(
                          //                               children: [
                          //                                 Image.asset(
                          //                                   e.iconPath,
                          //                                   height: 40,
                          //                                   width: 50,
                          //                                   fit: BoxFit.cover,
                          //                                 ),
                          //                                 const SizedBox(
                          //                                     width: 12),
                          //                                 Expanded(
                          //                                   child: Text(
                          //                                     e.name,
                          //                                     overflow:
                          //                                         TextOverflow
                          //                                             .ellipsis,
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                             controlAffinity:
                          //                                 ListTileControlAffinity
                          //                                     .trailing,
                          //                           );
                          //                         },
                          //                         separatorBuilder:
                          //                             (context, index) =>
                          //                                 const Divider(),
                          //                       ),
                          //                     ),
                          //                     const SizedBox(height: 12),
                          //                     SizedBox(
                          //                       width: double.infinity,
                          //                       child: ElevatedButton(
                          //                         onPressed:
                          //                             tmpSelectedPaymentMethod ==
                          //                                     null
                          //                                 ? null
                          //                                 : () {
                          //                                     setState(() {
                          //                                       selectedPaymentMethod =
                          //                                           tmpSelectedPaymentMethod;
                          //                                     });
                          //                                     Navigator.pop(
                          //                                         context);
                          //                                   },
                          //                         style:
                          //                             ElevatedButton.styleFrom(
                          //                           backgroundColor:
                          //                               Colors.blue,
                          //                           padding: const EdgeInsets
                          //                               .symmetric(vertical: 8),
                          //                           shape:
                          //                               RoundedRectangleBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     30),
                          //                           ),
                          //                         ),
                          //                         child: const Text(
                          //                           'Apply',
                          //                           style: TextStyle(
                          //                               fontSize: 18,
                          //                               color: Colors.white),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               );
                          //             },
                          //           );
                          //         },
                          //       );
                          //     }),

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
                              Text(StringUtil.formatMoney(
                                  selectedDeliveryMethod?.price ?? "0"))
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
