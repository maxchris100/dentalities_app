import 'dart:developer';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/widgets/bundling_product.dart';
import 'package:dentalities/presentation/widgets/home/checkout_reminder.dart';
import 'package:dentalities/presentation/widgets/home/home_banner.dart';
import 'package:dentalities/presentation/widgets/home/home_testimony.dart';
import 'package:dentalities/presentation/widgets/home/new_arrival_product.dart';
import 'package:dentalities/presentation/widgets/home/product_videos.dart';
import 'package:dentalities/presentation/widgets/home/today_discount.dart';
import 'package:dentalities/presentation/widgets/home/top_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/widgets/home/feature_product.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DateTime selectedDate = DateTime.now();
  DateTime? selectedDate2;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
      FocusScope.of(context).unfocus();
    });
  }

  void getData() async {
    try {} catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    // AuthCubit authCubit = context.watch<AuthCubit>();
    HomeCubit homeCubit = context.watch<HomeCubit>();
    CartCubit cartCubit = context.watch<CartCubit>();

    FocusScope.of(context).unfocus();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await homeCubit.init();
          await cartCubit.fetchCart();
        },
        child: ListView(
          controller: scrollController,
          children: [
            const SizedBox(height: 20),
            HomeBannerSection(),
            const SizedBox(height: 30),
            BlocBuilder(
                bloc: homeCubit,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                        crossAxisCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        childAspectRatio: 1.1,
                        children: homeCubit.data.featureCategories
                            .where((e) => e.name != "Testing Category")
                            .toList()
                            .map((e) {
                          // print(e.name);
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouter.search,
                                  arguments: {
                                    "category": e,
                                    "search_focus": 0
                                  });
                            },
                            child: _CategoryItem(
                                e.featureImageThumbUrl ??
                                    'assets/icons/home_icon.svg',
                                e?.name ?? ""),
                          );
                        }).toList()),
                  );
                }),
            // const SizedBox(height: 4),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(16),
            //       color: Colors.blue[50],
            //     ),
            //     padding: const EdgeInsets.all(16),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(children: [
            //           SvgPicture.asset("assets/icons/home_dental.svg"),
            //           SizedBox(width: 8),
            //           Text('What are you looking for?',
            //               style: TextStyle(fontWeight: FontWeight.bold)),
            //         ]),
            //         const SizedBox(height: 12),
            //         Wrap(
            //           spacing: 5,
            //           runSpacing: 0,
            //           children: [
            //             _FilterChip(
            //                 'Just show me everything you have',
            //                 Icon(
            //                   Icons.space_dashboard_outlined,
            //                   color: Colors.black,
            //                 )),
            //             _FilterChip(
            //                 'I want to see your speciality products',
            //                 SvgPicture.asset("assets/icons/filterai.svg",
            //                     color: Colors.black)),
            //             _FilterChip(
            //                 "I'm looking for videos of product tutorials or clinical cases",
            //                 Icon(Icons.play_circle_outline, color: Colors.black)),
            //             _FilterChip(
            //                 'Get lucky',
            //                 SvgPicture.asset("assets/icons/discount.svg",
            //                     color: Colors.black)),
            //             _FilterChip(
            //                 "I'd like to know my colleague's opinions",
            //                 SvgPicture.asset("assets/icons/chat.svg",
            //                     color: Colors.black)),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 24),
            BlocBuilder(
                bloc: cartCubit,
                builder: (context, state) {
                  return FeatureProductSection(
                    categories: homeCubit.data.carouselFeatureCategories,
                  );
                }),
            // SizedBox(
            //   height: 20,
            // ),
            ProductVideosSection(),
            // const SizedBox(height: 24),
            TodaysDiscountSection(),
            // SizedBox(
            //   height: 20,
            // ),
            // BundlingProductSection(
            //   title: "Save more with bundling",
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            BlocBuilder(
                bloc: homeCubit,
                builder: (context, state) {
                  return NewArrivalProductSection(
                    products: homeCubit.data.newArrival,
                  );
                }),
            SizedBox(
              height: 20,
            ),
            BlocBuilder(
                bloc: homeCubit,
                builder: (context, state) {
                  return Visibility(
                      visible: homeCubit.data.brands.isNotEmpty,
                      child: TopBrandSection(brands: homeCubit.data.brands));
                }),
            SizedBox(
              height: 20,
            ),
            BlocBuilder(
                bloc: cartCubit,
                builder: (context, state) {
                  return Visibility(
                    visible: (cartCubit.data.cart?.cartItems ?? []).isNotEmpty,
                    child: CheckoutReminderSection(
                      carts: cartCubit.data.cart?.cartItems ?? [],
                    ),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            HomeTestimonialSection(
              testimonies: homeCubit.data.testimonies.take(5).toList(),
            ),
            SizedBox(
              height: 14,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () {
                    scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: const Text(
                    'Back to Top',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const _CategoryItem(this.image, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          width: 36,
          height: 36,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/images/banner.png",
              width: 36,
              height: 36,
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
          maxLines: 2,
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final Widget icon;

  const _FilterChip(this.label, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon,
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}
