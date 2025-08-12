import 'package:dentalities/core/constant/colors.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/widgets/add_tocart_widget.dart';
import 'package:dentalities/presentation/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isNewArrival = true;

    double price = product.price ?? 0;
    if (price == 0) {
      price = product.productPrice ?? 0;
    }

    String brandName = product.brand?.name ?? "";
    if (brandName == "") {
      brandName = product.brandName ?? "";
    }
    return GestureDetector(
      onTap: () async {
        ProductCubit productCubit = context.read<ProductCubit>();
        Product? p = await productCubit.getProductDetail(product.slug ?? "");
        Navigator.pushNamed(
          context,
          AppRouter.productDetail,
          arguments: {"item": p},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // biar shrink sesuai isi
          children: [
            // --- IMAGE WITH TAGS ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.featureImage!.contains("http")
                        ? product.featureImage!
                        : product.featureImageUrl ?? "",
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isNewArrival)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      height: 35,
                      child: const Text(
                        "New\narrival",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
                if ((product.discountPercentage ?? 0) > 0)
                  Positioned(
                    bottom: 0,
                    left: isNewArrival ? 40 : 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 12, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      height: 35,
                      alignment: Alignment.center,
                      child: Text(
                        "5 % off",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // --- NAME ---
            Text(
              product.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),

            // --- PRICE ---
            Row(
              children: [
                Text(
                  StringUtil.formatMoney(
                    price,
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 6),
                if ((product.discountPercentage ?? 0) > 0)
                  Text(
                    StringUtil.formatMoney(product.priceBeforeDiscount),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 9,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),

            // --- BRAND ---
            Row(
              children: [
                SvgPicture.asset("assets/icons/purple_checklist.svg",
                    width: 12),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    brandName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // --- CART BUTTON ---
            OutlinedButton.icon(
              onPressed: () async {
                try {
                  ProductCubit productCubit = context.read<ProductCubit>();
                  Product? p =
                      await productCubit.getProductDetail(product.slug ?? "");
                  if (p != null) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (ctx) => AddToCartWidget(
                        product: p,
                        onTap: (int? variantId, int quantity) {
                          try {
                            productCubit.addToCart(p, quantity);
                            CustomToast.show(context,
                                message: "Successfully added to cart");
                          } catch (_) {}
                        },
                      ),
                    );
                  }
                } catch (_) {}
              },
              icon: Icon(Icons.add, size: 16, color: primaryColor),
              label: Text("Cart", style: TextStyle(color: primaryColor)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                minimumSize: const Size.fromHeight(36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
