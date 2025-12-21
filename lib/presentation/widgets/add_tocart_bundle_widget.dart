import 'dart:developer';

import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/product_bundle.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartBundleWidget extends StatefulWidget {
  final Function(int? productBundleId, int quantity) onTap;
  final ProductBundle? productBundle;
  const AddToCartBundleWidget(
      {super.key, required this.onTap, this.productBundle});

  @override
  State<AddToCartBundleWidget> createState() => _AddToCartBundleWidgetState();
}

class _AddToCartBundleWidgetState extends State<AddToCartBundleWidget> {
  int quantity = 1;

  CartCubit? cartCubit;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cartCubit = context.read<CartCubit>();
      await cartCubit?.fetchCart();
      setState(() {});
    });
  }

  // void initCartVariantQty() {
  //   if (selectedVariant == null) {
  //     return;
  //   }

  //   quantity = 1;
  //   for (CartItem e in cartCubit?.data.cart?.cartItems ?? []) {
  //     log("@CHECK Selected QTY: ${e.productVariantId} && ${selectedVariant?.id} : QTY: ${e.quantity}");
  //     if (e.productVariantId == selectedVariant?.id) {
  //       quantity = e.quantity ?? 1;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Close

            IconButton(
              padding: EdgeInsets.all(0),
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Add to cart',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),

            // Product info
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.productBundle?.featureImageUrl ?? "",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/banner.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productBundle?.name ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4),
                      Text(
                          StringUtil.formatMoney(
                              widget.productBundle?.bundlePrice),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Quantity
            const Text('Quantity',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                _QtyButton(
                  icon: Icons.remove,
                  onPressed:
                      quantity > 1 ? () => setState(() => quantity--) : null,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _QtyButton(
                  icon: Icons.add,
                  onPressed: () {
                    int stock = widget.productBundle?.lowestStockQuantity ?? 0;
                    if ((quantity + 1) > stock) {
                      return;
                    }
                    setState(() => quantity++);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Limited Stock: ${StringUtil.formatMoney(widget.productBundle?.lowestStockQuantity)} available",
                style: TextStyle(
                  color: Colors.brown.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // if (quantity < 3) ...[
            //   const SizedBox(height: 12),
            //   Container(
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: Colors.orange.shade50,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Row(
            //       children: [
            //         SvgPicture.asset(
            //           "assets/icons/discount_fill.svg",
            //         ),
            //         SizedBox(width: 8),
            //         Expanded(
            //             child: Text(
            //           'Add ${3 - 1} more to get discount',
            //           style: TextStyle(
            //               color: Color(0xffE65100),
            //               fontWeight: FontWeight.bold),
            //         )),
            //       ],
            //     ),
            //   ),
            // ],

            const SizedBox(height: 20),

            // Add to Cart Button
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: false
                    ? null
                    : () {
                        widget.onTap(widget.productBundle?.id, quantity);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 0),
                ),
                child: const Text('Add to Cart',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _QtyButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Icon(icon, size: 20),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
