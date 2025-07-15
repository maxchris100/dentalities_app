import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isAllItemsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Filter Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildFilterButton("All items", isAllItemsSelected, () {
                  setState(() {
                    isAllItemsSelected = true;
                  });
                }),
                const SizedBox(width: 10),
                _buildFilterButton("Boards", !isAllItemsSelected, () {
                  setState(() {
                    isAllItemsSelected = false;
                  });
                }),
              ],
            ),
          ),

          // Wishlist Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 0.65,
              crossAxisSpacing: 8,
              mainAxisSpacing: 16,
              children: [
                _buildWishlistItem(
                  imageUrl:
                      "https://images.unsplash.com/photo-1602810318383-e386cc9c8742?auto=format&fit=crop&w=400&q=80",
                  name: "Front Tie Mini Dress",
                  price: "\$59.00",
                  rating: 3.5,
                  reviews: 38,
                ),
                _buildWishlistItem(
                  imageUrl:
                      "https://images.unsplash.com/photo-1588666309991-b6fb168c8ab9?auto=format&fit=crop&w=400&q=80",
                  name: "Linen Dress",
                  price: "\$52.00",
                  oldPrice: "\$90.00",
                  rating: 4.5,
                  reviews: 64,
                ),
                _buildWishlistItem(
                  imageUrl:
                      "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?auto=format&fit=crop&w=400&q=80",
                  name: "Ohara Dress",
                  price: "\$85.00",
                  rating: 4.8,
                  reviews: 50,
                ),
                _buildWishlistItem(
                  imageUrl:
                      "https://images.unsplash.com/photo-1593032465171-8f9f24d8702d?auto=format&fit=crop&w=400&q=80",
                  name: "Tie Back Mini Dress",
                  price: "\$67.00",
                  rating: 4.0,
                  reviews: 39,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWishlistItem({
    required String imageUrl,
    required String name,
    required String price,
    String? oldPrice,
    required double rating,
    required int reviews,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(price,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            if (oldPrice != null) ...[
              const SizedBox(width: 6),
              Text(
                oldPrice,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              ),
            ]
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.green, size: 16),
            const SizedBox(width: 4),
            Text(
              "$rating ($reviews)",
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            )
          ],
        )
      ],
    );
  }
}
