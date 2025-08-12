import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';

class NewArrivalProductSection extends StatelessWidget {
  const NewArrivalProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: "TotalC-Ram Permanen Adhesive Resin Cement) 8g Syringe)",
        // title: 'PureOffice Professional Intracanal Dental Whiten...',
        brand: Brand(name: "Itena"),
        featureImage:
            "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/4FmL6ScFo1nn1zOfPfSe2NQH9e7mDpkciQFurRlo.jpeg",
        price: 985000,
        // oldPrice: 'Rp1.189.000',
        // badge: 'New arrival 10%',
      ),
      Product(
        name: "TotalC-Ram Permanen Adhesive Resin Cement) 8g Syringe)",
        // title: 'PureOffice Professional Intracanal Dental Whiten...',
        brand: Brand(name: "Itena"),
        featureImage:
            "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/product/4FmL6ScFo1nn1zOfPfSe2NQH9e7mDpkciQFurRlo.jpeg",
        price: 985000,
        // oldPrice: 'Rp1.189.000',
        // badge: 'New arrival 10%',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, "New Arrival"),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 kolom
              mainAxisSpacing: 16, // jarak vertikal
              crossAxisSpacing: 12, // jarak horizontal
              mainAxisExtent: 270, // tinggi fix sesuai card-mu
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product);
            },
          ),
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
