import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/product_bundle.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/widgets/add_tocart_bundle_widget.dart';
import 'package:dentalities/presentation/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductBundleDetailPage extends StatefulWidget {
  const ProductBundleDetailPage({super.key});

  @override
  State<ProductBundleDetailPage> createState() =>
      _ProductBundleDetailPageState();
}

class _ProductBundleDetailPageState extends State<ProductBundleDetailPage> {
  HomeCubit? homeCubit;
  ProductBundle? p;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)?.settings.arguments as Map?;
      p = args?["item"];

      // var args = ModalRoute.of(context)?.settings.arguments as Map?;
      // String slug = args?["slug"] ?? "";
      // productCubit.getProductDetail(slug);
      homeCubit = context.read<HomeCubit>();
      setState(() {});
    });
  }

  bool isInWishlist = false;
  int? wishlistId;
  CartCubit? cartCubit;
  ProductCubit productCubit = ProductCubit();

  addToCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => AddToCartBundleWidget(
        productBundle: productCubit.data.productBundle,
        onTap: (int? bundleId, int quantity) async {
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
          var message =
              await productCubit.addToCartBundle(context, bundleId, quantity);
          CustomToast.show(context, message: message);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    homeCubit = context.watch<HomeCubit>();
    var args = ModalRoute.of(context)?.settings.arguments as Map?;
    String slug = "";
    ProductBundle? p = args?["item"];
    if (p != null) {
      slug = p.slug ?? "";
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => productCubit..getProductBundleDetail(slug)),
      ],
      child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        ProductBundle? productBundle;
        if (state is ProductLoaded) {
          productBundle = state.data.productBundle;
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(''),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 12),
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
                  padding: EdgeInsets.only(right: 12),
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
                          child: Visibility(
                            visible: false,
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
          body: Column(
            children: [
              Visibility(
                visible: false,
                child: Container(
                  height: 60,
                  color: Colors.grey.shade200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeCubit?.data.carouselFeatureCategories.length,
                    itemBuilder: (context, index) {
                      final category =
                          homeCubit?.data.carouselFeatureCategories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, routeName);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.grey[300]!, // warna
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    category?.featureImageThumbUrl ??
                                        "", // ganti field gambar kategori
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(category?.name ?? "")
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
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
                          items: [productBundle?.featureImageUrl].map((media) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.network(
                                  media ?? "",
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

                    const SizedBox(height: 12),

                    // ===== Nama Produk =====
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                StringUtil.formatMoney(
                                    productBundle?.bundlePrice),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Visibility(
                                visible: double.parse(
                                        productBundle?.discountPercentage ??
                                            "0") >
                                    0,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      StringUtil.formatMoney(
                                          productBundle?.originalTotalPrice),
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
                              // Visibility(
                              //   visible: double.parse(
                              //           productBundle?.discountPercentage ??
                              //               "0") >
                              //       0,
                              //   child: Row(
                              //     children: [
                              //       SizedBox(
                              //         width: 8,
                              //       ),
                              //       Text(
                              //         double.parse(StringUtil.castToString(
                              //                     productBundle
                              //                         ?.discountPercentage))
                              //                 .toStringAsFixed(1) +
                              //             "%",
                              //         style: TextStyle(
                              //             color: Colors.red,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                          Text(
                            productBundle?.name ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   productBundle?.description ?? "",
                          //   style: TextStyle(fontSize: 12),
                          // ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),

                    // const SizedBox(height: 12),

                    // ===== Tentang Produk (key-value) =====

                    // SAVE
                    if (productBundle?.savingsAmount != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Save ${StringUtil.formatMoney(productBundle?.savingsAmount)}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                    "${double.parse(StringUtil.castToString(productBundle?.discountPercentage ?? 0)).toStringAsFixed(1)}% OFF",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    ExpandableHtml(
                      html: productBundle?.description ?? "",
                    ),
                    Divider(),
                    // const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Products in this Bundle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Column(
                      children: productBundle?.bundleItems!
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            BundleItem item = entry.value;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRouter.productDetail,
                                      arguments: {"item": item.product});
                                },
                                child: Row(
                                  children: [
                                    Image.network(
                                      item.product?.featureImageUrl ?? "",
                                      width: 50,
                                      height: 50,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/banner.png",
                                          width: 50,
                                          height: 50,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "x${item.quantity} " +
                                                (item.product?.name ?? ""),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            "SKU: " +
                                                (item.productVariant?.sku ??
                                                    ""),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.grey,
                                                fontSize: 11),
                                          ),
                                          Text(
                                            "Varian: " +
                                                (item.productVariant
                                                        ?.variantOneName ??
                                                    "-"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.grey,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Text(
                                    //   "x${item.quantity}",
                                    //   style:
                                    //       TextStyle(fontWeight: FontWeight.w500),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
              // ===== Tombol Tambah ke Keranjang =====
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 12, left: 16, right: 16),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      addToCart();
                    },
                    // : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: Size(0, 36),
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
          resizeToAvoidBottomInset: false,
          floatingActionButton: Transform.translate(
            offset: Offset(0, 10), // ↓ Turunkan sedikit ke bawah
            child: FloatingActionButton(
              onPressed: () async {
                String url = "https://wa.me/6281212049191";
                if (!await launchUrl(Uri.parse(url))) {
                  ToastUtil.showToastError("", 'Could not launch $url');
                }
              },
              shape: CircleBorder(),
              backgroundColor: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/home_cs.svg",
                    color: Colors.white,
                    height: 24,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 11,
                      color: homeCubit?.data.selectedIndex == 2
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Material(
            elevation: 12,
            color: Colors.white,
            shadowColor: Colors.black26, // lebih natural shadow-nya
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(
                        0, -2), // arah bayangan ke atas (karena dari bawah)
                  ),
                ],
              ),
              child: BottomAppBar(
                elevation: 12,
                color: Colors.transparent,
                height: 64,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: _buildNavItem(
                            homeCubit?.data.selectedIndex == 0
                                ? "assets/icons/home_home_selected.svg"
                                : "assets/icons/home_home.svg",
                            "Home",
                            0)),
                    Expanded(
                        child: _buildNavItem(
                            "assets/icons/home_wishlist.svg", "Wishlist", 1)),
                    Spacer(flex: 1), // Space for FAB
                    Expanded(
                        child: _buildNavItem(
                            "assets/icons/home_transaction.svg",
                            "Transaction",
                            3)),
                    Expanded(
                        child: _buildNavItem(
                            "assets/icons/home_profile.svg", "Profile", 4)),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _onItemTapped(int index) {
    Navigator.popUntil(context, (route) => route.isFirst);
    if (index == 0) {
      homeCubit?.setIndex(0);
    } else if (index == 1) {
      homeCubit?.setIndex(1);
    } else if (index == 3) {
      homeCubit?.setIndex(3);
    } else if (index == 4) {
      homeCubit?.setIndex(4);
    }
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = homeCubit?.data.selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.blue : Colors.grey,
            height: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.blue : Colors.grey,
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
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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

class VariantSection extends StatefulWidget {
  final String? varian1LabelName;
  final String? varian2LabelName;
  final String? varian3LabelName;
  final List<String> variant1list;
  final List<String> variant2list;
  final Function(String? variant1, String? variant2) onVariantSelected;

  const VariantSection({
    super.key,
    this.varian1LabelName,
    this.varian2LabelName,
    this.varian3LabelName,
    required this.variant1list,
    required this.variant2list,
    required this.onVariantSelected,
  });

  @override
  State<VariantSection> createState() => _VariantSectionState();
}

class _VariantSectionState extends State<VariantSection> {
  String? selectedVariant1;
  String? selectedVariant2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Variant",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          _buildLabel(
            widget.varian1LabelName ?? "",
          ),
          _buildValueList(
            widget.variant1list,
            selectedVariant1,
            (value) {
              setState(() {
                selectedVariant1 = value;
                _notifySelection();
              });
            },
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: widget.variant2list.isNotEmpty &&
                widget.variant2list.first != "_",
            child: Column(
              children: [
                _buildLabel(widget.varian2LabelName ?? ""),
                _buildValueList(
                  widget.variant2list,
                  selectedVariant2,
                  (value) {
                    setState(() {
                      selectedVariant2 = value;
                      _notifySelection();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildValueList(
    List<String> items,
    String? selectedItem,
    ValueChanged<String> onSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: items.map((item) {
          final isSelected = item == selectedItem;
          return GestureDetector(
            onTap: () => onSelected(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _notifySelection() {
    widget.onVariantSelected(selectedVariant1, selectedVariant2);
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
    return Visibility(
      visible: false,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What doctor said",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
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
            const SizedBox(height: 12),
            Row(
              children: [
                _buildDot(true),
                _buildDot(false),
                _buildDot(false),
              ],
            )
          ],
        ),
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
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
            const SizedBox(height: 12),
            // ...steps.map((e) => _buildStep(e)).toList(),
            if (onSeeMore != null)
              GestureDetector(
                onTap: onSeeMore,
                child: const Text("See more",
                    style: TextStyle(color: Colors.blue, fontSize: 14)),
              )
          ],
        ),
      ),
    );
  }

  // Widget _buildStep(HowToUseStep step) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 12),
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

class ExpandableHtml extends StatefulWidget {
  final String html;

  const ExpandableHtml({super.key, required this.html});

  @override
  State<ExpandableHtml> createState() => _ExpandableHtmlState();
}

class _ExpandableHtmlState extends State<ExpandableHtml> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final content = widget.html;
    final isLong = content.length > 80;

    final visibleText = expanded
        ? content
        : (isLong ? content.substring(0, 80) + "..." : content);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 3),
          child: Html(data: visibleText),
        ),
        if (isLong)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: GestureDetector(
              onTap: () => setState(() => expanded = !expanded),
              child: Text(
                expanded ? "See less" : "See more",
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ],
    );
  }
}
