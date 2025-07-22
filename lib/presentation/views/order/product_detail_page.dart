import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/domain/repositories/cart_repository.dart';
import 'package:dentalities/presentation/widgets/add_tocart_widget.dart';
import 'package:dentalities/presentation/widgets/added_tocart_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  addToCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => AddToCartWidget(
        onTap: () {
          Navigator.pop(ctx);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => AddedToCartWidget(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // ===== Gambar Produk =====
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ===== Nama Produk =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Digital Impression Scanner',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ===== Harga =====
                      Row(
                        children: [
                          Text(
                            StringUtil.castToString(10000),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  StringUtil.castToString(10000),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "10 %",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "DentoCrown HD Self-Curing Resin Automix Catridge (50ml) - limited to 3 rows",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                              height: 40,
                              width: 70,
                              child: Image.asset("assets/images/banner.png")),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Implants Diffusion International",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "French",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.favorite_border_outlined),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ===== Tentang Produk (key-value) =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildKeyValue('Specialization', 'General Dentistry'),
                      _buildKeyValue('Treatment', 'Cracked Tooth'),
                      _buildKeyValue(
                          'Product Type', 'Digital Impression Scanners'),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                // ===== Advantages =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const _ExpandableSection(
                    title: 'Advantages',
                    content: '''
                              • Mess-free restorations
                              • Saves time and reduces mess
                              • Cures well and bonds strongly
                              • Easy digital workflow''',
                  ),
                ),

                const SizedBox(height: 16),

                // ===== Indications =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const _ExpandableSection(
                    title: 'Indications',
                    content: '''
                              • Suitable for core build-ups
                              • Post cementation
                              • Cavity lining
                              • Crown and bridge impressions''',
                  ),
                ),

                const SizedBox(height: 24),

                const SizedBox(height: 32),
              ],
            ),
          ),
          // ===== Tombol Tambah ke Keranjang =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addToCart();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper untuk menampilkan informasi produk dalam format key-value
  static Widget _buildKeyValue(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              key,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget reusable untuk bagian expandable seperti Advantages dan Indications
class _ExpandableSection extends StatelessWidget {
  final String title;
  final String content;

  const _ExpandableSection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            content,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
