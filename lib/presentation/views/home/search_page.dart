import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/presentation/views/index/wishlist_tab.dart';
import 'package:dentalities/presentation/widgets/filter_bar.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/views/index/cart_tab.dart';
import 'package:dentalities/presentation/views/index/home_tab.dart';
import 'package:dentalities/presentation/views/index/profile_tab.dart';
import 'package:dentalities/presentation/views/index/cs_tab.dart';
import 'package:dentalities/presentation/widgets/app_drawer.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(left: 30)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search product',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRouter.cart);
                  },
                  child: Icon(Icons.shopping_cart_outlined))),
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AppRouter.notification);
                  },
                  child: Icon(Icons.notifications_none)))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          FilterBar(),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(12),
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6, // sesuaikan tinggi/lebarnya
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
            children: products.map((product) {
              return ProductCard(product: product);
            }).toList(),
          )),
        ],
      )),
    );
  }
}
