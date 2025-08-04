import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/views/order/webview_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  Transaction? item;
  String totalPrice = '0';
  String shipmentPrice = '0';
  String grandGrandTotalPrice = '0';
  String grandTotalPrice = "0";
  String totalDiscount = "0";
  int totalItem = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        item = args["item"];
        try {
          totalItem = item!.transactionItems!.length;
          totalPrice = item!.totalCost ?? "0";
          grandTotalPrice = item!.grandTotal ?? "0";
          shipmentPrice = item!.shippingCost ?? "0";
          grandGrandTotalPrice = StringUtil.formatMoney(
              double.parse(grandTotalPrice) + double.parse(shipmentPrice));
        } catch (e) {}
      }
      setState(() {});
    });
  }

  CartCubit cartCubit = CartCubit();

  Future refreshStatus() async {
    try {
      String id = item?.uuid ?? "";
      // "8b8f7377-9a21-4dc4-ac32-8128d775bcc2";
      await cartCubit.getOrderDetail(id);
      // if (cartCubit.data.transactionDetail?.status == "paid") {
      //   Navigator.pushNamed(context, AppRouter.paymentComplete);
      // }
      setState(() {});
    } catch (e) {}
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
                  Row(
                    children: [
                      Expanded(
                          child: Text("Order Number",
                              style: const TextStyle(color: Colors.grey))),
                      Text(item?.invoiceNumber ?? "",
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Text("Order Date",
                              style: const TextStyle(color: Colors.grey))),
                      Text(item?.createdAt ?? "",
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
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
                  SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ...(item?.transactionItems ?? []).map(
                            (p) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    p.productVariant?.product
                                            ?.featureImageUrl ??
                                        "",
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Text(
                                      p.productName ?? "",
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "x${p.quantity ?? 0}",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        StringUtil.formatMoney(p.price),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
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
                          item?.status ?? "",
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
                    subtitle: "Paid at ${item?.createdAt}",
                    isActive: item?.status == "unpaid",
                  ),
                  _buildStep(
                    icon: "assets/icons/status_processing_payment.svg",
                    title: "Processing payment",
                    subtitle: "Start validating at 15 July 2025, 20:49",
                    isActive: item?.status == "paid",
                  ),
                  _buildStep(
                    icon: "assets/icons/status_preparing_order.svg",
                    title: "Preparing order",
                    subtitle: "",
                    isActive: false,
                  ),
                  _buildStep(
                    icon: "assets/icons/status_shipping.svg",
                    title: "Shipping",
                    subtitle: "",
                    isActive: false,
                  ),
                  _buildStep(
                    icon: "assets/icons/status_done.svg",
                    title: "Done",
                    subtitle: "",
                    isActive: false,
                  ),
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
                      Text(grandGrandTotalPrice,
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
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
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required String icon,
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
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
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
