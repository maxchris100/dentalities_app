import 'dart:developer';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/views/order/webview_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage>
    with WidgetsBindingObserver {
  Transaction? item;
  String totalPrice = '0';
  String shipmentPrice = '0';
  String grandGrandTotalPrice = '0';
  String grandTotalPrice = "0";
  String totalDiscount = "0";
  int totalItem = 0;

  HomeCubit? homeCubit;
  CartCubit? cartCubit;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        item = args["item"];
        try {
          totalItem = item!.transactionItems!.length;
          totalPrice = item!.productCost ?? "0";
          totalDiscount = StringUtil.castToString(
              double.parse(item!.productCost ?? "0") -
                  double.parse(item!.totalAfterDiscount ?? "0"));
          grandTotalPrice = StringUtil.formatMoney(item!.grandTotal ?? "0");
          shipmentPrice = item!.shippingCost ?? "0";
          grandGrandTotalPrice = StringUtil.formatMoney(
              double.parse(grandTotalPrice) + double.parse(shipmentPrice));
        } catch (e) {}
      }
      setState(() {});

      homeCubit = context.read<HomeCubit>();
      cartCubit = context.read<CartCubit>();
      cartCubit?.getOrderTracking(item?.uuid);
    });
  }

  Future refreshStatus() async {
    try {
      log("@REFRESH STATUS");
      String? id = item?.uuid;
      // "8b8f7377-9a21-4dc4-ac32-8128d775bcc2";
      await cartCubit?.getOrderDetail(id);
      item = cartCubit?.data.transactionDetail;
      log("@REFRESH STATUS ITEM: ${item?.status.toString()}");
      // if (cartCubit.data.transactionDetail?.status == "paid") {
      //   Navigator.pushNamed(context, AppRouter.paymentComplete);
      // }
      setState(() {});
    } catch (e) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {
      refreshStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: item?.invoiceNumber ?? ""));
                      ToastUtil.showToast("", "Copied to Clipboard");
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("Order Number",
                                style: const TextStyle(color: Colors.grey))),
                        Row(
                          children: [
                            Text(item?.invoiceNumber ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.copy,
                              color: Colors.blue,
                              size: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Text("Order Date",
                              style: const TextStyle(color: Colors.grey))),
                      Text(
                          StringUtil.dateFormat(item?.createdAt ?? "",
                              format: "dd MMMM yyyy, HH:mm WIB"),
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 150,
                          child: Text("Shipping Address",
                              style: const TextStyle(color: Colors.grey))),
                      Expanded(
                        child: Text(
                            item?.shippingAddress?.getShippingAddress() ?? "",
                            textAlign: TextAlign.end,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  productItems(item?.transactionItems ?? []),
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: Column(
                  //       children: [
                  //         ...(item?.transactionItems ?? []).map((p) {
                  //           return Padding(
                  //             padding: const EdgeInsets.only(bottom: 12),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Image.network(
                  //                   p.productVariant?.product
                  //                           ?.featureImageUrl ??
                  //                       "",
                  //                   height: 40,
                  //                   width: 40,
                  //                   errorBuilder: (context, error, stackTrace) {
                  //                     return Image.asset(
                  //                       "assets/images/banner.png",
                  //                       height: 40,
                  //                       width: 40,
                  //                     );
                  //                   },
                  //                 ),
                  //                 SizedBox(
                  //                   width: 12,
                  //                 ),
                  //                 Expanded(
                  //                   child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         p.productName ?? "",
                  //                         style: const TextStyle(fontSize: 16),
                  //                         overflow: TextOverflow.ellipsis,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Text(
                  //                             (p.variantOneName ?? "") +
                  //                                 (p.variantTwoName != null
                  //                                     ? ", ${p.variantOneName} "
                  //                                     : ""),
                  //                             style:
                  //                                 TextStyle(color: Colors.grey),
                  //                           ),
                  //                           SizedBox(
                  //                             width: 8,
                  //                           ),
                  //                           Text(
                  //                             "(x ${p.quantity ?? 0})",
                  //                             style: const TextStyle(
                  //                                 color: Colors.grey),
                  //                           ),
                  //                           const SizedBox(width: 8),
                  //                         ],
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 // Row(
                  //                 //   children: [
                  //                 //     Text(
                  //                 //       StringUtil.formatMoney(p.price),
                  //                 //       style: const TextStyle(
                  //                 //           fontWeight: FontWeight.bold),
                  //                 //     ),
                  //                 //   ],
                  //                 // ),
                  //               ],
                  //             ),
                  //           );
                  //         }),
                  //       ],
                  //     )),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),

            // Stepper custom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: item?.status == "done"
                                ? Color(0xffE8F5E9)
                                : Color(0xffFFF3E0),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          item?.getStatusText() ?? "",
                          style: TextStyle(
                              color: item?.status == "done"
                                  ? Colors.green
                                  : Color(0xffE65100),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  _buildStep(
                      icon: "assets/icons/status_waiting_payment.svg",
                      title: "Waiting for payment",
                      subtitle:
                          "${item?.status == "unpaid" ? "Paid before" : "Paid at"} ${StringUtil.dateFormat(item?.expiredAt, format: "dd MMM yyyy HH:mm:ss")}",
                      isActive: item?.status == "unpaid",
                      status: item?.status),
                  _buildStep(
                      icon: "assets/icons/status_processing_payment.svg",
                      title: "Processing payment",
                      subtitle: "Start validating at 15 July 2025, 20:49",
                      isActive: item?.status == "paid",
                      status: item?.status),
                  _buildStep(
                      icon: "assets/icons/status_preparing_order.svg",
                      title: "Preparing order",
                      subtitle: "",
                      isActive: false,
                      status: item?.status),
                  _buildStep(
                      icon: "assets/icons/status_shipping.svg",
                      title: "Shipping",
                      subtitle: (item?.cnoteNo ?? "") != ""
                          ? "Shipping Address \nReceipt: ${item?.cnoteNo ?? ""}"
                          : "",
                      isActive: item?.status == "on_delivery",
                      status: item?.status),
                  _buildStep(
                      icon: "assets/icons/status_done.svg",
                      title: "Done",
                      subtitle: "",
                      isActive: item?.status == "done",
                      status: item?.status),
                ],
              ),
            ),

            const SizedBox(height: 4),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Payment Summary',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Product ($totalItem ${totalItem > 1 ? "items" : "item"})'),
                      Text(StringUtil.formatMoney(totalPrice))
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipment'),
                      Text(StringUtil.formatMoney(shipmentPrice))
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount', style: TextStyle(color: Colors.red)),
                      Text(StringUtil.formatMoney(totalDiscount),
                          style: TextStyle(color: Colors.red))
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    color: Colors.grey[300]!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(grandTotalPrice,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Visibility(
              visible: item?.status == "unpaid",
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 20, left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // String url = item?.paymentResponse?.redirectURL ?? "";
                      // if (!await launchUrl(Uri.parse(url))) {
                      //   ToastUtil.showToastError("", 'Could not launch $url');
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WebViewPaymentPage(
                            data: item!.toJson(),
                          ),
                        ),
                      ).then((x) {
                        refreshStatus();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('Continue to Payment',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: item?.status == "on_delivery",
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      //download invoice
                      String url = item?.shippingLabelPdfUrl ?? "";
                      if (!await launchUrl(Uri.parse(url))) {
                        ToastUtil.showToastError("", 'Could not launch $url');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('Download Resi Pengiriman',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10), // ↓ Turunkan sedikit ke bawah
        child: FloatingActionButton(
          onPressed: () async {
            String url = "https://wa.me/6281212049191";
            if (!await launchUrl(Uri.parse(url))) {
              ToastUtil.showToastError("", 'Could not launch $url');
            }
          },
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/home_cs.svg",
                color: Colors.white,
                height: 24,
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 11,
                  color: homeCubit?.data.selectedIndex == 2
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Material(
        elevation: 12,
        color: Colors.white,
        shadowColor: Colors.black26, // lebih natural shadow-nya
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset:
                    Offset(0, -2), // arah bayangan ke atas (karena dari bawah)
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 12,
            color: Colors.transparent,
            height: 64,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: _buildNavItem(
                        homeCubit?.data.selectedIndex == 0
                            ? "assets/icons/home_home_selected.svg"
                            : "assets/icons/home_home.svg",
                        "Home",
                        0)),
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_wishlist.svg", "Wishlist", 1)),
                Spacer(flex: 1), // Space for FAB
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_transaction.svg", "Transaction", 3)),
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_profile.svg", "Profile", 4)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productItems(List<TransactionItem> products) {
    bool expanded = false;
    return StatefulBuilder(builder: (context, setState) {
      List<TransactionItem> showItems = expanded
          ? products
          : products.take(3).toList(); // ambil max 3 kalau belum expand

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...showItems.map((p) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    p.productVariant?.product?.featureImageUrl ?? "",
                    height: 40,
                    width: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/banner.png",
                        height: 40,
                        width: 40,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.productName ?? "",
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                (p.variantOneName ?? "") +
                                    (p.variantTwoName != null
                                        ? ", ${p.variantTwoName} "
                                        : "") +
                                    "  (x ${p.quantity ?? 0})",
                                style: const TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // const SizedBox(width: 8),
                            // Text(
                            //   "(x ${p.quantity ?? 0})",
                            //   style: const TextStyle(color: Colors.grey),
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          // --- tombol view more / see less ---
          if (products.length > 3)
            GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  expanded ? "See Less Products" : "View More Products",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }

  void _onItemTapped(int index) {
    Navigator.popUntil(context, (route) => route.isFirst);
    if (index == 0) {
      homeCubit?.setIndex(0);
    } else if (index == 1) {
      homeCubit?.setIndex(1);
    } else if (index == 3) {
      homeCubit?.setIndex(3);
    } else if (index == 4) {
      homeCubit?.setIndex(4);
    }
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = homeCubit?.data.selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.blue : Colors.grey,
            height: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
      {required String icon,
      required String title,
      required String subtitle,
      required bool isActive,
      String? status}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            color: isActive ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.black : Colors.grey,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: isActive
                            ? status == "unpaid"
                                ? Colors.orange
                                : Colors.grey
                            : Colors.grey,
                        fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
