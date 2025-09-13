import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/home/feature_product.dart';
import 'package:dentalities/presentation/widgets/recommended_product.dart';
import 'package:dentalities/presentation/widgets/home/top_collection.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  CartCubit? cartCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productCubit = ProductCubit();
      productCubit.getSearchProduct(null);
      // getData();
      FocusScope.of(context).unfocus();

      cartCubit = context.read<CartCubit>();
      cartCubit?.getWishlist();
    });
  }

  late ProductCubit productCubit;
  void getData() async {
    try {} catch (ex) {}
  }

  final products = [
    Product(
      name: "Test",
      // title: 'PureOffice Professional Intracanal Dental Whiten...',
      // brand: Brand(name: ""),
      // image: 'assets/images/banner.png',
      price: 107000,
      // oldPrice: 'Rp1.189.000',
      // badge: 'New arrival 10%',
    ),
    Product(name: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => productCubit,
          ),
        ],
        child: BlocBuilder<ProductCubit, ProductState>(
            bloc: productCubit,
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                    child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 4),
                    //   child: Container(
                    //       child: Stack(children: [
                    //     Image.asset("assets/images/save_more_bundling.png"),
                    //     Positioned(
                    //         left: 12,
                    //         top: 8,
                    //         child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text("Acteon",
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 16,
                    //                       color: Colors.white)),
                    //               Text("France",
                    //                   style: TextStyle(color: Colors.white))
                    //             ]))
                    //   ])),
                    // ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(12),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.6, // sesuaikan tinggi/lebarnya
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
                        children: cartCubit!.data.wishlistProduct.map((w) {
                          return ProductCard(product: w.product!);
                        }).toList(),
                      ),
                    )),
                  ],
                )),
              );
            }));
  }
}
