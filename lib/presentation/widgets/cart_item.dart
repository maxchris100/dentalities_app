import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  final String name;
  final String variant;
  final String price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final ValueChanged<bool?> onChecked;

  const CartItem({
    super.key,
    required this.isSelected,
    required this.imageUrl,
    required this.name,
    required this.variant,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isSelected,
            onChanged: onChecked,
            activeColor: Colors.blue,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(variant,
                              style: TextStyle(color: Colors.blueGrey)),
                          SizedBox(
                            height: 6,
                          ),
                          Text(price,
                              style: TextStyle(
                                color:
                                    price == 'FREE' ? Colors.red : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              _buildQtyButton(Icons.remove, onRemove),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(quantity.toString(),
                                      style: const TextStyle(fontSize: 16)),
                                ),
                              ),
                              _buildQtyButton(Icons.add, onAdd),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: Colors.blue),
      ),
    );
  }
}
