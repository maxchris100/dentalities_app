import 'package:flutter/material.dart';
import 'package:foriyana_app/core/router/app_router.dart';
import 'package:foriyana_app/presentation/widgets/product_model.dart';

class FeatureProductSection extends StatelessWidget {
  const FeatureProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
          title: "Turtleneck Sweater",
          price: 39.99,
          image: "assets/images/startup1.webp"),
      Product(
          title: "Long Sleeve Dress",
          price: 45.00,
          image: "assets/images/startup1.webp"),
      Product(title: "Sportwear", price: 80.00, image: "assets/sportwear.png"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader("Feature Products"),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, AppRouter.productDetail,
                    // arguments: {"item": product}
                  );
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Image.asset(product.image,
                          height: 120, fit: BoxFit.cover),
                      const SizedBox(height: 8),
                      Text(product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("\$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text("Show all", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
