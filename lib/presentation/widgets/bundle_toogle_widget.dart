import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/data/models/product_bundle.dart';
import 'package:flutter/material.dart';

class BundleContentToggle extends StatefulWidget {
  final List<BundleItem> itemBundle;

  const BundleContentToggle({
    super.key,
    required this.itemBundle,
  });

  @override
  State<BundleContentToggle> createState() => _BundleContentToggleState();
}

class _BundleContentToggleState extends State<BundleContentToggle> {
  bool isBundleVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isBundleVisible = !isBundleVisible;
            });
          },
          child: Row(
            children: [
              Icon(
                isBundleVisible
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 14,
                color: Colors.blue,
              ),
              const SizedBox(width: 4),
              Text(
                isBundleVisible
                    ? "Hide bundle contents (${widget.itemBundle.length} products)"
                    : "View bundle contents (${widget.itemBundle.length} products)",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        // CONTENT
        Visibility(
          visible: isBundleVisible,
          child: Column(
            children: widget.itemBundle.map((item) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.productDetail,
                      arguments: {
                        "item": item.product,
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.network(
                        item.product?.featureImageUrl ?? "",
                        width: 50,
                        height: 50,
                        errorBuilder: (_, __, ___) {
                          return Image.asset(
                            "assets/images/banner.png",
                            width: 50,
                            height: 50,
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "x${item.quantity ?? 0} ${item.product?.name ?? ""}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "SKU: ${item.productVariant?.sku ?? "-"}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              "Varian: ${item.productVariant?.variantOneName ?? "-"}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
