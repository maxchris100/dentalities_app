import 'dart:developer';

import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/cart_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/product_variant_model.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartWidget extends StatefulWidget {
  final Function(int? variantId, int quantity) onTap;
  final Product? product;
  final ProductVariant? selectedVariant;
  const AddToCartWidget(
      {super.key, required this.onTap, this.product, this.selectedVariant});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  int quantity = 1;
  Map<String, Map<String, Map<String, ProductVariant>>> variantMap = {};
  List<String> variant1list = [];
  List<String> variant2list = [];
  List<String> variant3list = [];

  String? selectedVariant1;
  String? selectedVariant2;
  String? selectedVariant3;

  ProductVariant? selectedVariant;

  CartCubit? cartCubit;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cartCubit = context.read<CartCubit>();
      await cartCubit?.fetchCart();
      if (widget.selectedVariant != null) {
        selectedVariant = widget.selectedVariant;
        selectedVariant1 = widget.selectedVariant?.variantOneName ?? "_";
        selectedVariant2 = widget.selectedVariant?.variantTwoName ?? "_";
        selectedVariant3 = widget.selectedVariant?.variantThreeName ?? "_";
        initCartVariantQty();
      }
      setState(() {});
    });
  }

  void setSelectedVariant() {
    if (selectedVariant3 != "_") {
      selectedVariant = variantMap[selectedVariant1 ?? "_"]
          ?[selectedVariant2 ?? "_"]?[selectedVariant3 ?? "_"];
    } else if (selectedVariant2 != "_") {
      selectedVariant = variantMap[selectedVariant1]?[selectedVariant2]?["_"];
    } else {
      selectedVariant = variantMap[selectedVariant1]?["_"]?["_"];
    }

    log("Selected Variant ID: ${selectedVariant?.id} "
        "${selectedVariant?.variantOneName} "
        "${selectedVariant?.variantTwoName} "
        "${selectedVariant?.variantThreeName}");

    initCartVariantQty();

    price = selectedVariant?.price ?? widget.product?.price ?? 0.0;
    setState(() {});
  }

  void initCartVariantQty() {
    if (selectedVariant == null) {
      return;
    }
    price = selectedVariant?.price ?? widget.product?.price ?? 0.0;

    quantity = 1;
    for (CartItem e in cartCubit?.data.cart?.cartItems ?? []) {
      log("@CHECK Selected QTY: ${e.productVariantId} && ${selectedVariant?.id} : QTY: ${e.quantity}");
      if (e.productVariantId == selectedVariant?.id) {
        quantity = e.quantity ?? 1;
      }
    }
  }

  double price = 0;

  @override
  Widget build(BuildContext context) {
    try {
      for (ProductVariant item in widget.product?.productVariants ?? []) {
        var v1 = item.variantOneName ?? "";
        var v2 = item.variantTwoName ?? "";
        var v3 = item.variantThreeName ?? "";

        // Level 1
        variantMap.putIfAbsent(v1, () => {});

        // Jika hanya ada varian 1
        if (v2.isEmpty && v3.isEmpty) {
          variantMap[v1]!["_"] = {"_": item};
          continue;
        }

        // Level 2
        variantMap[v1]!.putIfAbsent(v2.isEmpty ? "_" : v2, () => {});

        // Level 3
        variantMap[v1]![v2.isEmpty ? "_" : v2]![v3.isEmpty ? "_" : v3] = item;
      }

      // Ambil semua list level 1
      variant1list = variantMap.keys.toList();

      // Ambil list level 2 dari varian pertama
      if (variant1list.isNotEmpty) {
        variant2list = variantMap[variant1list.first]!.keys.toList();
      }

      // Ambil list level 3 dari varian pertama + level2 pertama
      if (variant2list.isNotEmpty) {
        variant3list =
            variantMap[variant1list.first]![variant2list.first]!.keys.toList();
      }
    } catch (e) {}

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
                        widget.product?.displayName ?? "",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4),
                      Text(StringUtil.formatMoney(price),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "SKU: ${selectedVariant?.sku ?? ""}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // --- VARIANT 1 ---
            Text(
              widget.product?.variantOne ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: variant1list.map((v1) {
                final isSelected = selectedVariant1 == v1;
                return ChoiceChip(
                  label: Text(
                    v1,
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  showCheckmark: false,
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedVariant1 = v1;
                      // selectedVariant2 = null;
                      // selectedVariant3 = null;
                    });
                    setSelectedVariant();
                  },
                  selectedColor: Colors.blue,
                );
              }).toList(),
            ),

// --- VARIANT 2 ---
            if (variant2list.isNotEmpty && variant2list.first != "_")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product?.variantTwo ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8,
                    children: variant2list.map((v2) {
                      final isSelected = selectedVariant2 == v2;
                      return ChoiceChip(
                        label: Text(
                          v2,
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black),
                        ),
                        showCheckmark: false,
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedVariant2 = v2;
                            // selectedVariant3 = null;
                          });
                          setSelectedVariant();
                        },
                        selectedColor: Colors.blue,
                      );
                    }).toList(),
                  ),
                ],
              ),

            // Variant 3
            if (variant3list.isNotEmpty && variant3list.first != "_")
              Column(
                children: [
                  // Text(
                  //   widget.product?.variantOne ?? "",
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Wrap(
                    spacing: 8,
                    children: variant3list.map((v3) {
                      final isSelected = selectedVariant3 == v3;
                      return ChoiceChip(
                        label: Text(
                          v3,
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black),
                        ),
                        showCheckmark: false,
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedVariant3 = v3;
                          });
                          setSelectedVariant();
                        },
                        selectedColor: Colors.blue,
                      );
                    }).toList(),
                  ),
                ],
              ),

            const SizedBox(height: 12),
            // // Size
            // const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
            // const SizedBox(height: 8),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: sizes.map((size) {
            //     final isSelected = selectedSize == size;
            //     return ChoiceChip(
            //       label: Text(size),
            //       selected: isSelected,
            //       showCheckmark: false,
            //       onSelected: (_) => setState(() => selectedSize = size),
            //       selectedColor: Colors.blue.shade100,
            //       backgroundColor: Colors.white,
            //       labelStyle: TextStyle(
            //         color: isSelected ? Colors.blue : Colors.grey,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           side: BorderSide(
            //               color: isSelected ? Colors.blue : Colors.grey)),
            //     );
            //   }).toList(),
            // ),

            // const SizedBox(height: 20),

            // // Color
            // const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
            // const SizedBox(height: 8),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: colors.map((color) {
            //     final isSelected = selectedColor == color;
            //     return ChoiceChip(
            //       label: Text(color),
            //       selected: isSelected,
            //       showCheckmark: false,
            //       onSelected: (_) => setState(() => selectedColor = color),
            //       selectedColor: Colors.blue.shade100,
            //       backgroundColor: Colors.white,
            //       labelStyle: TextStyle(
            //         color: isSelected ? Colors.blue : Colors.grey,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           side: BorderSide(
            //               color: isSelected ? Colors.blue : Colors.grey)),
            //     );
            //   }).toList(),
            // ),

            // const SizedBox(height: 20),

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

            // if (quantity < 3) ...[
            //   const SizedBox(height: 12),
            //   Container(
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: Colors.orange.shade50,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Row(
            //       children: [
            //         SvgPicture.asset(
            //           "assets/icons/discount_fill.svg",
            //         ),
            //         SizedBox(width: 8),
            //         Expanded(
            //             child: Text(
            //           'Add ${3 - 1} more to get discount',
            //           style: TextStyle(
            //               color: Color(0xffE65100),
            //               fontWeight: FontWeight.bold),
            //         )),
            //       ],
            //     ),
            //   ),
            // ],

            const SizedBox(height: 20),

            // Add to Cart Button
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedVariant == null
                    // variantMap[selectedVariant1 ?? "_"]
                    //                 ?[selectedVariant2 ?? "_"]
                    //             ?[selectedVariant3 ?? "_"] ==
                    //         null
                    // selectedVariant1 == null &&
                    //         selectedVariant2 == null &&
                    //         selectedVariant3 == null
                    ? null
                    : () {
                        // if (selectedVariant2 != null) {
                        //   selectedVariant = variantMap[selectedVariant1]
                        //       ?[selectedVariant2]?["_"]!;
                        // } else {
                        //   selectedVariant =
                        //       variantMap[selectedVariant1]?["_"]?["_"];
                        // }
                        log("UPDATE CART Selected Variant ID: ${selectedVariant?.id} ${selectedVariant?.variantOneName} ${selectedVariant?.variantTwoName} ${selectedVariant?.variantThreeName} : (QTY: $quantity)");
                        widget.onTap(selectedVariant?.id, quantity);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 0),
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
