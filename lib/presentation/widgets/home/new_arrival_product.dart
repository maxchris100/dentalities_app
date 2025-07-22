import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';

class NewArrivalProductSection extends StatelessWidget {
  const NewArrivalProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(name: ""),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, "New Arrival"),
          SizedBox(
              height: 500,
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
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
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
                Navigator.pushNamed(context, AppRouter.productDetail,
                    arguments: {"title": "Feature Product"});
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
