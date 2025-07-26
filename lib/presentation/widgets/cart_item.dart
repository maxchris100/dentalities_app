import 'package:dentalities/core/router/app_router.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  final String name;
  final String slug;
  final String variant;
  final String price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final ValueChanged<bool?> onChecked;
  final bool isGrid;

  const CartItem(
      {super.key,
      required this.isSelected,
      required this.imageUrl,
      required this.name,
      required this.slug,
      required this.variant,
      required this.price,
      required this.quantity,
      required this.onAdd,
      required this.onRemove,
      required this.onChecked,
      this.isGrid = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: isGrid
          ? Row(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.productDetail,
                                  arguments: {"slug": slug});
                            },
                            child: Image.network(
                              imageUrl,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                Text(variant,
                                    style: TextStyle(color: Colors.blueGrey)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(price,
                                    style: TextStyle(
                                      color: price == 'FREE'
                                          ? Colors.red
                                          : Colors.black,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(quantity.toString(),
                                            style:
                                                const TextStyle(fontSize: 16)),
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
            )
          : Row(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                Text(variant,
                                    style: TextStyle(color: Colors.blueGrey)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(price,
                                    style: TextStyle(
                                      color: price == 'FREE'
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 90,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                _buildQtyButton2(Icons.remove, onRemove),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    quantity.toString(),
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                _buildQtyButton2(Icons.add, onAdd),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
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

  Widget _buildQtyButton2(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, size: 18, color: Colors.blue),
    );
  }
}
