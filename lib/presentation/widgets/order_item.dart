import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/transaction_response_model.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Transaction item;
  const OrderItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID and Date
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       item.invoiceNumber ?? "",
          //       style:
          //           const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //     ),
          //     Text(
          //       '',
          //       style: const TextStyle(color: Colors.grey),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 8),

          // Divider(),
          Column(
            children: (item.transactionItems ?? [])
                .take(1)
                .toList()
                .asMap()
                .entries
                .map((e) {
              return Row(
                children: [
                  Image.network(
                    e.value.productVariant?.product?.featureImageUrl ?? "",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(e.value.productName ?? ""),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${e.value.quantity}x ",
                                style: TextStyle(),
                              ),
                              Text(
                                StringUtil.formatMoney(e.value.price),
                                style: TextStyle(),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                          Text(
                            StringUtil.formatMoney(e.value.subtotal),
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Visibility(
                          visible: (item.transactionItems ?? []).length > 1,
                          child: Text(
                              "+ ${(item.transactionItems ?? []).length} Produk lainnya"))
                    ],
                  )),
                ],
              );
            }).toList(),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: item.status == "done"
                        ? Color(0xffE8F5E9)
                        : Color(0xffFFF3E0),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  item.getStatusText(),
                  style: TextStyle(
                      color: item.status == "done"
                          ? Colors.green
                          : Color(0xffE65100),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.orderDetail,
                            arguments: {"item": item});
                      },
                      child: const Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 30,
                      width: 100,
                      child: item.status == "unpaid"
                          ? ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text('Pay',
                                  style: TextStyle(color: Colors.white)),
                            )
                          : item.status == "done"
                              ? OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: const Text('Buy Again',
                                      style: TextStyle(color: Colors.blue)),
                                )
                              : Text(""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
