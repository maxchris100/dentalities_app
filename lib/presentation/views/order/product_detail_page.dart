import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedColor = 0;
  int selectedSize = 2; // 0=S, 1=M, 2=L

  final List<Color> colorOptions = [
    const Color(0xFFF5D7CC), // cream
    Colors.black,
    Colors.pink,
  ];

  final List<String> sizeOptions = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              _buildTopBar(context),
              Image.asset(
                'assets/images/startup1.webp',
                height: 300,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: _buildDetails(context),
              ),
            ],
          ),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back_ios_new, size: 16),
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleAndPrice(),
            const SizedBox(height: 12),
            _buildRating(),
            const SizedBox(height: 12),
            _buildColorSelector(),
            const SizedBox(height: 16),
            _buildSizeSelector(),
            const Divider(height: 24),
            ExpansionTile(
              title: const Text("Description"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Soft cotton sportwear set, comfortable for daily wear or light training activities.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Reviews"),
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "⭐️⭐️⭐️⭐️⭐️  - Very comfy and stylish!\n⭐️⭐️⭐️⭐️   - Good material but size runs small.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Sportwear Set',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$ 80.00',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: const [
        Icon(Icons.star, color: Colors.green, size: 20),
        Icon(Icons.star, color: Colors.green, size: 20),
        Icon(Icons.star, color: Colors.green, size: 20),
        Icon(Icons.star, color: Colors.green, size: 20),
        Icon(Icons.star, color: Colors.green, size: 20),
        SizedBox(width: 8),
        Text("(83)", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildColorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color", style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            colorOptions.length,
            (index) {
              final selected = selectedColor == index;
              return GestureDetector(
                onTap: () => setState(() => selectedColor = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: colorOptions[index],
                    radius: 14,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Size", style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            sizeOptions.length,
            (index) {
              final selected = selectedSize == index;
              return GestureDetector(
                onTap: () => setState(() => selectedSize = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected ? Colors.black : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    sizeOptions[index],
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(bottom: 16, top: 8),
        color: Colors.white,
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.shopping_bag),
          label: const Text("Add To Cart"),
        ),
      ),
    );
  }
}
