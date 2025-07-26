import 'package:dentalities/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BundlingProductSection extends StatelessWidget {
  final String title;
  const BundlingProductSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + See All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),

        const SizedBox(height: 8),

        // List of bundle cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: const [
              BundlingCard(
                title: "Semorr Promo Package",
                totalPrice: "Rp1.070.000",
                originalPrice: "Rp1.900.000",
                products: [
                  BundledItem(
                    name:
                        "PureOffice Professional Intracanal Dental Whitening Kit 35% HP (5g Syri...",
                    price: "Rp1.070.000",
                    originalPrice: "Rp1.400.000",
                    seller: "Semorr",
                    image: 'assets/images/banner.png',
                  ),
                  BundledItem(
                    name: "Silan-IT Silane Bottle (5ml)",
                    price: "Free",
                    originalPrice: "Rp500.000",
                    seller: "Semorr",
                    image: 'assets/images/banner.png',
                  ),
                ],
              ),
              SizedBox(height: 16),
              BundlingCard(
                title: "Endodontics Promo Package",
                totalPrice: "Rp470.000",
                originalPrice: "Rp720.000",
                products: [
                  BundledItem(
                    name: "DentoClic Refill of 5 Translucent Glass Fiber Posts",
                    price: "Rp370.000",
                    originalPrice: "Rp360.000",
                    seller: "Mico One",
                    image: 'assets/images/banner.png',
                  ),
                  BundledItem(
                    name: "Silan-IT Silane Bottle (5ml)",
                    price: "Rp100.000",
                    originalPrice: "Rp360.000",
                    seller: "Implants Diffusion International",
                    image: 'assets/images/banner.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BundlingCard extends StatelessWidget {
  final String title;
  final String totalPrice;
  final String originalPrice;
  final List<BundledItem> products;

  const BundlingCard({
    super.key,
    required this.title,
    required this.totalPrice,
    required this.originalPrice,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Package name + price + cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text(totalPrice,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 100,
                child: OutlinedButton.icon(
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
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...products.map((item) => _ProductItemCard(item: item)).toList(),
        ],
      ),
    );
  }
}

class BundledItem {
  final String name;
  final String price;
  final String originalPrice;
  final String seller;
  final String image;

  const BundledItem({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.seller,
    required this.image,
  });
}

class _ProductItemCard extends StatelessWidget {
  final BundledItem item;

  const _ProductItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      item.price,
                      style: TextStyle(
                        color: item.price.toLowerCase() == "free"
                            ? Colors.red
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.originalPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
