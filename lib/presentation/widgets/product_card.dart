import 'package:dentalities/core/constant/colors.dart';
import 'package:dentalities/data/models/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  final ProductResponseModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    bool isNewArrival = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.image), fit: BoxFit.contain),
              ),
            ),
            Positioned(
              bottom: 0,
              left: isNewArrival ? 40 : 0,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 12, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                height: 35,
                alignment: Alignment.center,
                child: Text(
                  "5 % off",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
            if (isNewArrival)
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  height: 35,
                  child: const Text(
                    "New\narrival",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(product.brand, maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(product.price,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              width: 8,
            ),
            Text(product.price,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, fontSize: 11)),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset("assets/icons/purple_checklist.svg"),
            SizedBox(
              width: 8,
            ),
            Text("Semor")
          ],
        ),
        const SizedBox(height: 6),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 16,
            color: primaryColor,
          ),
          label: Text(
            "Cart",
            style: TextStyle(color: primaryColor),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            minimumSize: const Size.fromHeight(36),
          ),
        ),
      ],
    );
  }
}
