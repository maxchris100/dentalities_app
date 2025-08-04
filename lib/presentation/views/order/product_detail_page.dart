import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/domain/repositories/cart_repository.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/widgets/add_tocart_widget.dart';
import 'package:dentalities/presentation/widgets/added_tocart_widget.dart';
import 'package:dentalities/presentation/widgets/bundling_product.dart';
import 'package:dentalities/presentation/widgets/custom_toast.dart';
import 'package:dentalities/presentation/widgets/home/related_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // var args = ModalRoute.of(context)?.settings.arguments as Map?;
      // String slug = args?["slug"] ?? "";
      // productCubit.getProductDetail(slug);
    });
  }

  ProductCubit productCubit = ProductCubit();

  addToCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => AddToCartWidget(
        product: productCubit.data.product,
        onTap: (int quantity) {
          // Navigator.pop(ctx);
          // showModalBottomSheet(
          //   context: context,
          //   isScrollControlled: true,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          //   ),
          //   builder: (_) => AddedToCartWidget(),
          // );
          //add to cart
          try {
            productCubit.addToCart(productCubit.data.product, quantity);
            CustomToast.show(context, message: "Successfully added to cart");
          } catch (e) {}
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map?;
    String slug = "";
    Product? p = args?["item"];
    if (p != null) {
      slug = p.slug ?? "";
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => productCubit..getProductDetail(slug)),
      ],
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        Product? product;
        if (state is ProductLoaded) {
          product = state.data.product;
        }
        log("@PRODUCT MEDIA: ${product?.productMedia?.length}");
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(''),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouter.search);
                          },
                          child: Icon(Icons.search)),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouter.cart);
                          },
                          child: Icon(Icons.shopping_cart_outlined)),
                      Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ))
                    ],
                  ))
            ],
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
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 250,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            viewportFraction: 1, // biar full width
                          ),
                          items: (product?.productMedia ?? []).map((media) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.network(
                                  media.imageUrl,
                                  width: 250,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/banner.png",
                                      width: 250,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                );
                              },
                            );
                          }).toList(),
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
                          Text(
                            product?.name ?? "",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // ===== Harga =====
                          Row(
                            children: [
                              Text(
                                StringUtil.formatMoney(product?.price),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Visibility(
                                visible: (product?.discountPercentage ?? 0) > 0,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      StringUtil.formatMoney(
                                          product?.priceBeforeDiscount),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: (product?.discountPercentage ?? 0) > 0,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      StringUtil.castToString(
                                              product?.discountPercentage) +
                                          "%",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Html(
                            data: product?.description ?? "",
                          ),
                          // Text(
                          //   product?.description ?? "",
                          //   style: TextStyle(fontSize: 16),
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 40,
                                  width: 70,
                                  child:
                                      Image.asset("assets/images/banner.png")),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product?.brand?.name ?? "",
                                    // "Implants Diffusion International",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    product?.brand?.name ?? "",
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
                    Divider(),
                    const SizedBox(height: 16),
                    // ===== Advantages =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const _ExpandableSection(
                        title: 'Advantages',
                        icon: "assets/icons/product_detail_advantage.svg",
                        content: '• Mess-free restorations ',
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ===== Indications =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const _ExpandableSection(
                        title: 'Indications',
                        icon: "assets/icons/product_detail_indication.svg",
                        content: '• Mess-free restorations ',
                      ),
                    ),

                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),
                    VariantSection(
                      sizes: ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL'],
                      colors: [
                        'Black',
                        'Blue',
                        'Dark Purple',
                        'Golden',
                        'Green',
                        'Orange',
                        'Red',
                        'White',
                        'Yellow'
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(),

                    const SizedBox(height: 16),
                    DoctorReviewCard(
                      name: "drg. Fajar Pratama, Sp.Pros",
                      date: "10 July 2025",
                      comment:
                          "Easy to use with great consistency. The automix system saves time and reduces mess. Cures well and bonds strongly—perfect for core build-ups. Will definitely reorder!",
                      imageUrl:
                          "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/category/v3pkGkkVixPnrNTVToS8I5kU3MQeX6yUtUMIHn8L.jpeg",
                    ),
                    const SizedBox(height: 16),
                    Divider(),

                    const SizedBox(height: 16),
                    HowToUseSection(
                      videoThumbnailUrl:
                          "https://mydentalshop.s3.ap-southeast-3.amazonaws.com/category/v3pkGkkVixPnrNTVToS8I5kU3MQeX6yUtUMIHn8L.jpeg",
                      videoDuration: "12:00",
                      onSeeMore: () {},
                    ),
                    const SizedBox(height: 16),
                    Divider(),
                    const SizedBox(height: 16),
                    BundlingProductSection(title: "Buy with Supplementaries"),
                    const SizedBox(height: 16),
                    RelatedProductSection(
                      products: productCubit.data.relatedProduct,
                    ),
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
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
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
  final String icon;

  const _ExpandableSection(
      {required this.title, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Text(
          content,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black87),
        ),
        Text(
          "See More",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
        )
      ],
    );
  }
}

class VariantSection extends StatelessWidget {
  final List<String> sizes;
  final List<String> colors;

  const VariantSection({
    super.key,
    required this.sizes,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Variant",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _buildLabel("Size"),
          _buildValueList(sizes),
          const SizedBox(height: 12),
          _buildLabel("Color"),
          _buildValueList(colors),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.bold));
  }

  Widget _buildValueList(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: items
            .map((e) => Text(
                  e,
                  style: const TextStyle(color: Colors.black87),
                ))
            .toList(),
      ),
    );
  }
}

class DoctorReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String comment;
  final String imageUrl;

  const DoctorReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.comment,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("What doctor said",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/banner.png");
                  },
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "“$comment”",
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDot(true),
              _buildDot(false),
              _buildDot(false),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDot(bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: 20,
      height: 4,
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class HowToUseSection extends StatelessWidget {
  final String videoThumbnailUrl;
  final String videoDuration;
  // final List<HowToUseStep> steps;
  final VoidCallback? onSeeMore;

  const HowToUseSection({
    super.key,
    required this.videoThumbnailUrl,
    required this.videoDuration,
    // required this.steps,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("How to Use",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  videoThumbnailUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned.fill(
                child: Center(
                    child: Icon(Icons.play_circle_fill,
                        size: 56, color: Colors.white)),
              ),
              Positioned(
                bottom: 8,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    videoDuration,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          // ...steps.map((e) => _buildStep(e)).toList(),
          if (onSeeMore != null)
            GestureDetector(
              onTap: onSeeMore,
              child: const Text("See more",
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
            )
        ],
      ),
    );
  }

  // Widget _buildStep(HowToUseStep step) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 16),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(8),
  //           child: Image.network(step.imageUrl,
  //               width: 64, height: 64, fit: BoxFit.cover),
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(step.title,
  //                   style: const TextStyle(fontWeight: FontWeight.bold)),
  //               Text(step.duration, style: const TextStyle(color: Colors.blue)),
  //               const SizedBox(height: 4),
  //               Text(step.description),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
