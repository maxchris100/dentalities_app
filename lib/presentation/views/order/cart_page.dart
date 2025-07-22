import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> selected = [true, true, true];
  List<int> quantity = [2, 2, 2];
  bool selectAll = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text("${selected.where((e) => e).length} products selected"),
                const Spacer(),
                TextButton(
                  onPressed: _clearAll,
                  child: const Text("Clear"),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CartItem(
                  isSelected: selected[0],
                  imageUrl: 'assets/images/banner.png',
                  name:
                      'PureOffice Professional Intracanal Dental Whitening Kit 35% HP (5g Syringe)',
                  variant: 'S, Dark Purple',
                  price: 'Rp1.070.000',
                  quantity: quantity[0],
                  onAdd: () => _changeQty(0, 1),
                  onRemove: () => _changeQty(0, -1),
                  onChecked: (val) => _toggleItem(0, val),
                ),
                CartItem(
                  isSelected: selected[1],
                  imageUrl: 'assets/images/banner.png',
                  name: 'ProviTemp Temporary Cement (5ml Syringe)',
                  variant: 'S, Dark Purple',
                  price: 'Rp450.000',
                  quantity: quantity[1],
                  onAdd: () => _changeQty(1, 1),
                  onRemove: () => _changeQty(1, -1),
                  onChecked: (val) => _toggleItem(1, val),
                ),
                CartItem(
                  isSelected: selected[2],
                  imageUrl: 'assets/images/banner.png',
                  name:
                      'Hydrospeed HD Light Body Quick (2 × 50ml 1:1 Cartridges with 12 Yellow EcoMix Mixing Tips)',
                  variant: 'S, Dark Purple',
                  price: 'FREE',
                  quantity: quantity[2],
                  onAdd: () => _changeQty(2, 1),
                  onRemove: () => _changeQty(2, -1),
                  onChecked: (val) => _toggleItem(2, val),
                ),
              ],
            ),
          ),
          _buildBottomBar()
        ],
      ),
    );
  }

  void _toggleItem(int index, bool? val) {
    setState(() {
      selected[index] = val ?? false;
      selectAll = selected.every((e) => e);
    });
  }

  void _changeQty(int index, int delta) {
    setState(() {
      quantity[index] = (quantity[index] + delta).clamp(1, 99);
    });
  }

  void _clearAll() {
    setState(() {
      selected = List.filled(selected.length, false);
      selectAll = false;
    });
  }

  Widget _buildBottomBar() {
    int total = selected[0] ? 1070000 * quantity[0] : 0;
    total += selected[1] ? 450000 * quantity[1] : 0;
    // FREE item = 0

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200))),
      child: Row(
        children: [
          Checkbox(
              activeColor: Colors.blue,
              value: selectAll,
              onChanged: (val) {
                setState(() {
                  selectAll = val ?? false;
                  selected = List.filled(selected.length, selectAll);
                });
              }),
          const Text("All"),
          const Spacer(),
          Text(
            "Rp${_formatCurrency(total)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: total > 0
                ? () {
                    Navigator.pushNamed(context, AppRouter.orderCheckout);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Payment',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}
