// import 'package:dentalities/core/constant/colors.dart';
// import 'package:dentalities/core/router/app_router.dart';
// import 'package:dentalities/core/util/string_util.dart';
// import 'package:dentalities/data/models/product_model.dart';
// import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
// import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
// import 'package:dentalities/presentation/widgets/add_tocart_widget.dart';
// import 'package:dentalities/presentation/widgets/custom_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     bool isNewArrival = true;
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, AppRouter.productDetail,
//             arguments: {"item": product});
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: 100,
//                     child: Image.network(
//                       product.featureImage ?? "",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   )
//                 ],
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: isNewArrival ? 40 : 0,
//                 child: Container(
//                   padding: const EdgeInsets.only(
//                       left: 16, right: 12, top: 4, bottom: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.pinkAccent,
//                     borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(12),
//                       bottomLeft: Radius.circular(12),
//                     ),
//                   ),
//                   height: 35,
//                   alignment: Alignment.center,
//                   child: Text(
//                     "5 % off",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 9,
//                     ),
//                   ),
//                 ),
//               ),
//               if (isNewArrival)
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     decoration: const BoxDecoration(
//                       color: Colors.orange,
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(12),
//                         bottomLeft: Radius.circular(12),
//                       ),
//                     ),
//                     height: 35,
//                     child: const Text(
//                       "New\narrival",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 9,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(product.name ?? "",
//               maxLines: 2, overflow: TextOverflow.ellipsis),
//           const SizedBox(height: 4),
//           Row(
//             children: [
//               Text(StringUtil.formatMoney(product.price),
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(
//                 width: 8,
//               ),
//               Visibility(
//                 visible: (product.discountPercentage ?? 0) > 0,
//                 child: Text(
//                   StringUtil.formatMoney(product.priceBeforeDiscount),
//                   style: const TextStyle(
//                       decoration: TextDecoration.lineThrough, fontSize: 9),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               SvgPicture.asset("assets/icons/purple_checklist.svg"),
//               SizedBox(
//                 width: 8,
//               ),
//               Text(product.brand?.name ?? "")
//             ],
//           ),
//           const SizedBox(height: 6),
//           OutlinedButton.icon(
//             onPressed: () async {
//               // try {
//               //   CartCubit cartCubit = context.read<CartCubit>();
//               //   cartCubit.addToCart();
//               // } catch (e) {}
//               try {
//                 ProductCubit productCubit = context.read<ProductCubit>();
//                 Product? p =
//                     await productCubit.getProductDetail(product.slug ?? "");
//                 if (p != null) {
//                   //tampilkan cart
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(20)),
//                     ),
//                     builder: (ctx) => AddToCartWidget(
//                       product: p,
//                       onTap: (int quantity) {
//                         //add to cart
//                         try {
//                           productCubit.addToCart(p, quantity);
//                           CustomToast.show(context,
//                               message: "Successfully added to cart");
//                         } catch (e) {}
//                       },
//                     ),
//                   );
//                 }
//               } catch (e) {}
//             },
//             icon: Icon(
//               Icons.add,
//               size: 16,
//               color: primaryColor,
//             ),
//             label: Text(
//               "Cart",
//               style: TextStyle(color: primaryColor),
//             ),
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(color: primaryColor),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               minimumSize: const Size.fromHeight(36),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
