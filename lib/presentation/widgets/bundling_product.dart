import 'package:dentalities/core/constant/colors.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/feature_product_bundle.dart';
import 'package:flutter/material.dart';

class BundlingProductSection extends StatelessWidget {
  final String title;
  final List<FeaturedBundle> bundles;
  const BundlingProductSection(
      {super.key, required this.title, required this.bundles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 380,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: bundles.first.featuredBundleItems!.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final featuredBundleItem =
                  bundles.first.featuredBundleItems![index];
              return ProductBundleCard(bundle: featuredBundleItem);
            },
          ),
        ),
        // List of bundle cards
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Column(
        //     children: const [
        //       BundlingCard(
        //         title: "Semorr Promo Package",
        //         totalPrice: "Rp1.070.000",
        //         originalPrice: "Rp1.900.000",
        //         products: [
        //           BundledItem(
        //             name:
        //                 "PureOffice Professional Intracanal Dental Whitening Kit 35% HP (5g Syri...",
        //             price: "Rp1.070.000",
        //             originalPrice: "Rp1.400.000",
        //             seller: "Semorr",
        //             image: 'assets/images/banner.png',
        //           ),
        //           BundledItem(
        //             name: "Silan-IT Silane Bottle (5ml)",
        //             price: "Free",
        //             originalPrice: "Rp500.000",
        //             seller: "Semorr",
        //             image: 'assets/images/banner.png',
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 16),
        //       BundlingCard(
        //         title: "Endodontics Promo Package",
        //         totalPrice: "Rp470.000",
        //         originalPrice: "Rp720.000",
        //         products: [
        //           BundledItem(
        //             name: "DentoClic Refill of 5 Translucent Glass Fiber Posts",
        //             price: "Rp370.000",
        //             originalPrice: "Rp360.000",
        //             seller: "Mico One",
        //             image: 'assets/images/banner.png',
        //           ),
        //           BundledItem(
        //             name: "Silan-IT Silane Bottle (5ml)",
        //             price: "Rp100.000",
        //             originalPrice: "Rp360.000",
        //             seller: "Implants Diffusion International",
        //             image: 'assets/images/banner.png',
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

// class BundlingCard extends StatelessWidget {
//   final String title;
//   final String totalPrice;
//   final String originalPrice;
//   final List<BundledItem> products;

//   const BundlingCard({
//     super.key,
//     required this.title,
//     required this.totalPrice,
//     required this.originalPrice,
//     required this.products,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade300),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Package name + price + cart button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Row(
//                     children: [
//                       Text(totalPrice,
//                           style: const TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(width: 8),
//                       Text(
//                         originalPrice,
//                         style: const TextStyle(
//                           decoration: TextDecoration.lineThrough,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 100,
//                 child: OutlinedButton.icon(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.add,
//                     size: 16,
//                     color: primaryColor,
//                   ),
//                   label: Text(
//                     "Cart",
//                     style: TextStyle(color: primaryColor),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: primaryColor),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     minimumSize: const Size.fromHeight(36),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           ...products.map((item) => _ProductItemCard(item: item)).toList(),
//         ],
//       ),
//     );
//   }
// }

// class BundledItem {
//   final String name;
//   final String price;
//   final String originalPrice;
//   final String seller;
//   final String image;

//   const BundledItem({
//     required this.name,
//     required this.price,
//     required this.originalPrice,
//     required this.seller,
//     required this.image,
//   });
// }

// class _ProductItemCard extends StatelessWidget {
//   final BundledItem item;

//   const _ProductItemCard({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Text(
//                       item.price,
//                       style: TextStyle(
//                         color: item.price.toLowerCase() == "free"
//                             ? Colors.red
//                             : Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       item.originalPrice,
//                       style: const TextStyle(
//                         decoration: TextDecoration.lineThrough,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     SvgPicture.asset("assets/icons/purple_checklist.svg"),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     Text("Semor")
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProductBundleCard extends StatelessWidget {
  final FeaturedBundleItem bundle;

  const ProductBundleCard({
    super.key,
    required this.bundle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.productBundleDetail,
          arguments: {
            "item": bundle.productBundle,
          },
        );
      },
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IMAGE
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        bundle.productBundle?.featureImageUrl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAME
                      Text(
                        bundle.productBundle?.name ?? '-',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // PRICE
                      Text(
                        StringUtil.formatMoney(
                            bundle.productBundle?.bundlePrice),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // ORIGINAL PRICE (STRIKETHROUGH)
                      Text(
                        StringUtil.formatMoney(
                            bundle.productBundle?.originalTotalPrice),
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // SAVE
                      if (bundle.productBundle?.savingsAmount != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Save ${StringUtil.formatMoney(bundle.productBundle?.savingsAmount)}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                      const SizedBox(height: 8),

                      // STOCK
                      Text(
                        (bundle.productBundle?.stockQuantity ?? 0) > 0
                            ? "Stock: ${bundle.productBundle?.stockQuantity ?? 0} available"
                            : "Stock: out of stock",
                        style: TextStyle(
                          color: (bundle.productBundle?.stockQuantity ?? 0) > 0
                              ? Colors.grey
                              : Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              left: 5,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Bundle",
                      style: TextStyle(color: Colors.white, fontSize: 10))),
            ),
            Positioned(
              top: 33,
              left: 5,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                      "${double.parse(StringUtil.castToString(bundle.productBundle?.discountPercentage ?? 0)).toStringAsFixed(1)}% OFF",
                      style: TextStyle(color: Colors.white, fontSize: 10))),
            ),
          ],
        ),
      ),
    );
  }
}
