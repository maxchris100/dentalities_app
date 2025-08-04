import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartWidget extends StatefulWidget {
  final Function(int quantity) onTap;
  final Product? product;
  const AddToCartWidget({super.key, required this.onTap, this.product});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  final List<String> sizes = ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> colors = [
    'Black',
    'Blue',
    'Dark Purple',
    'Golden',
    'Orange',
    'Red',
    'White',
    'Yellow'
  ];

  String? selectedSize = 'S';
  String? selectedColor = 'Dark Purple';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Close

            IconButton(
              padding: EdgeInsets.all(0),
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Add to cart',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),

            // Product info
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.product?.featureImageUrl ?? "",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/banner.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product?.name ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4),
                      Text(StringUtil.formatMoney(widget.product?.price),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Size
            const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: sizes.map((size) {
                final isSelected = selectedSize == size;
                return ChoiceChip(
                  label: Text(size),
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (_) => setState(() => selectedSize = size),
                  selectedColor: Colors.blue.shade100,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.grey)),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Color
            const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: colors.map((color) {
                final isSelected = selectedColor == color;
                return ChoiceChip(
                  label: Text(color),
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (_) => setState(() => selectedColor = color),
                  selectedColor: Colors.blue.shade100,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.grey)),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Quantity
            const Text('Quantity',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                _QtyButton(
                  icon: Icons.remove,
                  onPressed:
                      quantity > 1 ? () => setState(() => quantity--) : null,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _QtyButton(
                  icon: Icons.add,
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),

            if (quantity < 3) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/discount_fill.svg",
                    ),
                    SizedBox(width: 8),
                    Expanded(
                        child: Text(
                      'Add ${3 - 1} more to get discount',
                      style: TextStyle(
                          color: Color(0xffE65100),
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onTap(quantity);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Add to Cart',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _QtyButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Icon(icon, size: 20),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
