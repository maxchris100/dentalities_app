import 'package:dentalities/core/constant/colors.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutReminderSection extends StatelessWidget {
  final List<CartItem> carts;
  const CheckoutReminderSection({super.key, required this.carts});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: carts.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Don't forget to checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                      children: carts.asMap().entries.map((e) {
                    return Padding(
                      padding: e.key > 0
                          ? const EdgeInsets.only(top: 8)
                          : EdgeInsets.zero,
                      child: _buildCartItem(
                        title: e.value.productName ?? "",
                        price: StringUtil.formatMoney(e.value.price),
                        priceBeforeDiscount: e.value.discount?.toString(),
                        brand: e.value.sku ?? "",
                        image: e.value.productImage ?? "",
                      ),
                    );
                  }).toList()),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.cart);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: primaryColor),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text("View all item in cart",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Icon(Icons.chevron_right, color: Colors.blue),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String title,
    required String price,
    String? priceBeforeDiscount,
    required String brand,
    required String image,
  }) {
    return Row(
      children: [
        Image.network(
          image,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/images/banner.png",
              width: 40,
              height: 40,
            );
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Text(price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )),
                  Visibility(
                    visible: priceBeforeDiscount != null,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(priceBeforeDiscount ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.verified, size: 14, color: Colors.purple),
                  const SizedBox(width: 4),
                  Text(brand, style: const TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
