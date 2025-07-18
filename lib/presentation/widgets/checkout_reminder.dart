import 'package:dentalities/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CheckoutReminderSection extends StatelessWidget {
  const CheckoutReminderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Don't forget to checkout",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    _buildCartItem(
                      title:
                          "PureOffice Professional Intracanal Dental Whitening Kit 35% HP (5g Syrin...",
                      price: "Rp1.070.000",
                      brand: "Semorr",
                      image: "assets/images/banner.png",
                    ),
                    const SizedBox(height: 12),
                    _buildCartItem(
                      title: "Silan-IT Silane Bottle (5ml)",
                      price: "Rp0",
                      brand: "Semorr",
                      image: "assets/images/banner.png",
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined, color: primaryColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text("View all item in cart",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                    Icon(Icons.chevron_right, color: Colors.blue),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem({
    required String title,
    required String price,
    required String brand,
    required String image,
  }) {
    return Row(
      children: [
        Image.asset(image, width: 40, height: 40),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const Icon(Icons.verified, size: 14, color: Colors.purple),
                  const SizedBox(width: 4),
                  Text(brand, style: const TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
