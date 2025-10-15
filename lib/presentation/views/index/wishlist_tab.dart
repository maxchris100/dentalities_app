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

  bool isLoadingMore = false;
  int _currentPage = 1;
  final int _limit = 50;
  bool _hasMore = true;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!isLoadingMore && _hasMore) {
          setState(() {
            isLoadingMore = true;
          });
          _currentPage++;

          final newProducts = await cartCubit?.getWishlist(
                  page: _currentPage, limit: _limit, loadMore: true) ??
              [];

          if (newProducts.isEmpty) {
            // Tidak ada produk baru
            _hasMore = false;
          }
          setState(() {
            isLoadingMore = false;
          });
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();

      cartCubit = context.read<CartCubit>();
      cartCubit?.getWishlist(page: _currentPage, limit: _limit);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
    cartCubit = context.watch<CartCubit>();
    return BlocBuilder(
        bloc: cartCubit,
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
                  controller: _scrollController,
                  child: Column(
                    children: [
                      GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(12),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.6, // sesuaikan tinggi/lebarnya
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
                        children: cartCubit!.data.wishlistProduct.map((w) {
                          return ProductCard(
                            product: w.product!,
                            isWishlist: true,
                            refreshWishlist: () {
                              cartCubit?.getWishlist();
                            },
                          );
                        }).toList(),
                      ),
                      if (isLoadingMore)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    ],
                  ),
                )),
              ],
            )),
          );
        });
  }
}
