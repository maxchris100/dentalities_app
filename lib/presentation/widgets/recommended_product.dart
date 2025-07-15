import 'package:flutter/material.dart';
import 'package:foriyana_app/presentation/widgets/product_model.dart';

class RecommendedProductSection extends StatelessWidget {
  const RecommendedProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final recommended = [
      Product(
          title: "White fashion hoodie",
          price: 29.00,
          image: "assets/images/startup1.webp"),
      Product(
          title: "Cotton tee",
          price: 30.00,
          image: "assets/images/startup1.webp"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader("Recommended"),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: recommended.length,
            itemBuilder: (context, index) {
              final item = recommended[index];
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Image.asset(item.image, height: 100),
                    const SizedBox(height: 4),
                    Text(item.title,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text("\$${item.price.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.grey)),
                  ],
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
