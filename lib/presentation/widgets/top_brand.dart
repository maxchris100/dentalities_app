import 'package:flutter/material.dart';

class TopBrandSection extends StatelessWidget {
  const TopBrandSection({super.key});

  final List<Map<String, String>> brands = const [
    {"image": "assets/images/banner.png"},
    {"image": "assets/images/banner.png"},
    {"image": "assets/images/banner.png"},
    {"image": "assets/images/banner.png"},
    {"image": "assets/images/banner.png"},
    {"image": "assets/images/banner.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top brands",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: brands.map((brand) {
              return Container(
                width: MediaQuery.of(context).size.width / 2 - 24,
                height: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  brand['image']!,
                  fit: BoxFit.contain,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
