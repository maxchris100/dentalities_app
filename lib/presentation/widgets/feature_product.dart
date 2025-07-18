import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/models/product_response_model.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FeatureProductSection extends StatelessWidget {
  const FeatureProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductResponseModel(
        title: 'PureOffice Professional Intracanal Dental Whiten...',
        brand: 'Semorr',
        image: 'assets/images/banner.png',
        price: 'Rp1.070.000',
        oldPrice: 'Rp1.189.000',
        badge: 'New arrival 10%',
      ),
      ProductResponseModel(
        title: 'ProviTemp Temporary Cement (5ml Syringe)',
        brand: 'Implants Diffusion Internati...',
        image: 'assets/images/banner.png',
        price: 'Rp450.000',
        oldPrice: 'Rp475.000',
        badge: '5%',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, "Special for your speciality"),
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
              child:
                  const Text("Show all", style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
