import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String size;
  final String color;
  final bool isSelected;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.size,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text('Size: $size  |  Color: $color',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _qtyButton(Icons.remove),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("1"),
                  ),
                  _qtyButton(Icons.add),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: Icon(icon, size: 18),
    );
  }
}
