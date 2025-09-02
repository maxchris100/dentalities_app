import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:flutter/material.dart';

class TopBrandSection extends StatelessWidget {
  final List<Brand> brands;
  const TopBrandSection({super.key, required this.brands});

  // final List<Map<String, String>> brands = const [
  //   {"image": "assets/images/banner.png"},
  //   {"image": "assets/images/banner.png"},
  //   {"image": "assets/images/banner.png"},
  //   {"image": "assets/images/banner.png"},
  //   {"image": "assets/images/banner.png"},
  //   {"image": "assets/images/banner.png"},
  // ];

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
              const Text("Top Brands",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push
              //   },
              //   child: const Text(
              //     "See All",
              //     style: TextStyle(
              //       color: Colors.blue,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: brands.map((brand) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.search, arguments: {
                    "brand": brand,
                    "search_focus": 0,
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  height: 70,
                  // padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(12), // Sama dengan BoxDecoration
                    child: Image.network(
                      brand.featureImageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
