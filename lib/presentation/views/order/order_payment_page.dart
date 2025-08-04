import 'dart:developer';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/views/order/webview_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPaymentPage extends StatefulWidget {
  const OrderPaymentPage({super.key});

  @override
  State<OrderPaymentPage> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage>
    with WidgetsBindingObserver {
  String accountNumber = "";

  CartCubit cartCubit = CartCubit();

  var response;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      //check status -> if paid -> push payment complete
      if (args != null) {
        response = args["item"];
// "id" -> 248
// 2 =
// "status" -> "unpaid"
// 3 =
// "expired_at" -> "2025-08-04T14:33:28.000Z"
// 4 =
// "uuid" -> "b3f3f771-5f0c-4bdf-b39a-e497bbf230d9"
// 5 =
// "invoice_number" -> "INVT120250800248"
// 6 =
// "product_cost" -> 17730000
// 7 =
// "shipping_cost" -> 1750000
// 8 =
// "total_cost" -> 19480000
// 9 =
// "total_after_discount" -> 19480000
// 10 =
// "tax" -> 0
// 11 =
// "grand_total" -> 19480000
// 12 =
// "weight" -> 0
// 13 =
// "shipping_courier_code" -> "JNE"
// 14 =
// "shipping_courier_name" -> "JNE"
// 15 =
// "shipping_service_code" -> "JTR>200"
// 16 =
// "user_id" -> 3
      }
      // cartCubit = context.read<CartCubit>();
      // item = cartCubit.data.transactionDetail;
      refreshStatus();
    });
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

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to Clipboard')),
    );
  }

  Future refreshStatus() async {
    try {
      String id = response["uuid"];
      // "8b8f7377-9a21-4dc4-ac32-8128d775bcc2";
      await cartCubit.getOrderDetail(id);
      if (cartCubit.data.transactionDetail?.status == "paid") {
        Navigator.pushNamed(context, AppRouter.paymentComplete);
      }
      setState(() {});
    } catch (e) {}
  }

  // Transaction? item;
  @override
  Widget build(BuildContext context) {
    log("@ ${response}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deadline
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Pay before\nWednesday, 23 Jul 2025",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Chip(
                  label: Text(
                    "23:30:59",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Transfer Info
            Row(
              children: [
                Image.asset(
                  "assets/images/banner.png",
                  height: 32,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Transfer to BCA",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Account Number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Account number\n$accountNumber",
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => copyToClipboard(context, accountNumber),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Total Payment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total payment\n${StringUtil.formatMoney(response["grand_total"])}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // IconButton(
                //   icon: const Icon(Icons.copy),
                //   onPressed: () => copyToClipboard(
                //       context, StringUtil.formatMoney(item?.grandTotal)),
                // ),
              ],
            ),
            const SizedBox(height: 24),

            // Payment Instructions
            const Text(
              "Payment Instructions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              "1. Access a BCA Service like ATM BCA, m-BCA, etc.\n"
              "2. Select the Transfer Menu.\n"
              "3. Choose the transfer to BCA account.\n"
              "4. Enter recipient account number as above.\n"
              "5. Make sure transfer details are correct.\n"
              "6. Enter your PIN code.\n"
              "7. You'll see a confirmation screen or receive a printed receipt.",
              style: TextStyle(fontSize: 14, height: 1.4),
            ),

            const Spacer(),

            // Buttons
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // final Map<String, dynamic> checkoutData = {
                      //   "status": "pending",
                      //   "expired_at": "2025-08-02T12:00:00.000Z",
                      //   "uuid": "abcd-1234-xyz",
                      //   "invoice_number": "INV-001",
                      //   "product_cost": "100000",
                      //   "shipping_cost": "20000",
                      //   "total_cost": "120000",
                      //   "discount": "10000",
                      //   "total_after_discount": "110000",
                      //   "unique_code": 123,
                      //   "tax": "5000",
                      //   "grand_total": "115000",
                      //   "payment_id": 1,
                      //   "shipping_courier_code": "JNE",
                      //   "shipping_courier_name": "Jalur Nugraha Ekakurir",
                      //   "shipping_service_code": "REG",
                      //   "shipping_service_name": "Regular Service",
                      //   "shipping_logo": "https://example.com/logo.png",
                      //   "user_id": 101,
                      //   "cnote_no": null,
                      //   "tracking_history": null,
                      //   "created_at": "2025-08-02T11:00:00.000Z",
                      //   "payment_response": {
                      //     "merchantID": "M123456",
                      //     "transactionNo": "TRX987654321",
                      //     "insertStatus": "success",
                      //     "insertMessage": "Payment created",
                      //     "transactionEngine": "Bayarind",
                      //     "redirectURL":
                      //         "https://dentalities.shop/payment-success"
                      //   },
                      //   "transaction_items": [
                      //     {
                      //       "price": 50000,
                      //       "total": 50000,
                      //       "weight": 1.2,
                      //       "discount": 0,
                      //       "quantity": 1,
                      //       "subtotal": 50000,
                      //       "product_name": "Pasta Gigi Dentalities",
                      //       "product_slug": "pasta-gigi-dentalities",
                      //       "transaction_id": 123,
                      //       "variant_one_id": "v1",
                      //       "variant_two_id": "v2",
                      //       "variant_one_name": "100ml",
                      //       "variant_three_id": null,
                      //       "variant_two_name": "Mint",
                      //       "product_variant_id": 10,
                      //       "variant_three_name": null,
                      //       "product_feature_image":
                      //           "https://example.com/product1.png",
                      //       "product_feature_image_path":
                      //           "/uploads/product1.png"
                      //     },
                      //     {
                      //       "price": 60000,
                      //       "total": 60000,
                      //       "weight": 1.5,
                      //       "discount": 5000,
                      //       "quantity": 1,
                      //       "subtotal": 55000,
                      //       "product_name": "Sikat Gigi Dentalities",
                      //       "product_slug": "sikat-gigi-dentalities",
                      //       "transaction_id": 123,
                      //       "variant_one_id": "v1",
                      //       "variant_two_id": "v2",
                      //       "variant_one_name": "Soft",
                      //       "variant_three_id": null,
                      //       "variant_two_name": "Blue",
                      //       "product_variant_id": 11,
                      //       "variant_three_name": null,
                      //       "product_feature_image":
                      //           "https://example.com/product2.png",
                      //       "product_feature_image_path":
                      //           "/uploads/product2.png"
                      //     }
                      //   ]
                      // };
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WebViewPaymentPage(
                            data: response,
                          ),
                        ),
                      ).then((x) {
                        refreshStatus();
                      });
                    },
                    child: const Text("Pay"),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Explore More Product"),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      refreshStatus();
                    },
                    child: const Text("View Payment Status"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
