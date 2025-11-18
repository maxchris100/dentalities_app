import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureProductSection extends StatelessWidget {
  final List<Category> categories;
  const FeatureProductSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    // final products = [
    //   Product(
    //     name: "TotalC-Ram Permanen Adhesive Resin Cement) 8g Syringe)",
    //     // title: 'PureOffice Professional Intracanal Dental Whiten...',
    //     brand: Brand(name: "Itena"),
    //     featureImage:
    //         "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/4FmL6ScFo1nn1zOfPfSe2NQH9e7mDpkciQFurRlo.jpeg",
    //     price: 985000,
    //     // oldPrice: 'Rp1.189.000',
    //     // badge: 'New arrival 10%',
    //   ),
    //   Product(
    //     name: "TotalC-Ram Permanen Adhesive Resin Cement) 8g Syringe)",
    //     // title: 'PureOffice Professional Intracanal Dental Whiten...',
    //     brand: Brand(name: "Itena"),
    //     featureImage:
    //         "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/4FmL6ScFo1nn1zOfPfSe2NQH9e7mDpkciQFurRlo.jpeg",
    //     price: 985000,
    //     // oldPrice: 'Rp1.189.000',
    //     // badge: 'New arrival 10%',
    //   ),
    //   Product(
    //     name: "TotalC-Ram Permanen Adhesive Resin Cement) 8g Syringe)",
    //     // title: 'PureOffice Professional Intracanal Dental Whiten...',
    //     brand: Brand(name: "Itena"),
    //     featureImage:
    //         "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/4FmL6ScFo1nn1zOfPfSe2NQH9e7mDpkciQFurRlo.jpeg",
    //     price: 985000,
    //     // oldPrice: 'Rp1.189.000',
    //     // badge: 'New arrival 10%',
    //   ),
    //   // Product(
    //   //   name: "Silan-IT Silane Bottle(5ml)",
    //   //   brand: Brand(name: "Itena"),
    //   //   price: 200000,
    //   //   featureImage:
    //   //       "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/ctSjY75opxY3EHVLEpzdsdEh8RmSpgO17zYIztBP.jpeg",
    //   // ),
    // ];
    return Visibility(
      visible: categories.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categories.asMap().entries.map((entry) {
            int index = entry.key;
            Category category = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(
                    context, category.name ?? "Category $index", category),
                const SizedBox(height: 12),
                SizedBox(
                  height: 270, // tinggi tetap
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.products.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, productIndex) {
                      final product = category.products[productIndex];
                      return SizedBox(
                        width: 150,
                        child: ProductCard(product: product),
                      );
                    },
                  ),
                ),
              ],
            );
          }).toList(),

          // [
          //   _buildHeader(context, "You might like"),
          //   const SizedBox(height: 12),
          //   GridView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: products.length,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, // 2 kolom
          //       mainAxisSpacing: 16, // jarak vertikal
          //       crossAxisSpacing: 12, // jarak horizontal
          //       mainAxisExtent: 270, // tinggi fix sesuai card-mu
          //     ),
          //     itemBuilder: (context, index) {
          //       final product = products[index];
          //       return ProductCard(product: product);
          //     },
          //   ),
          // ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, Category e) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.search,
                    arguments: {"category": e, "search_focus": 0});
              },
              child: const Text("See All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ))),
        ],
      ),
    );
  }
}
