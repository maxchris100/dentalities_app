import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBannerSection extends StatefulWidget {
  const HomeBannerSection({super.key});

  @override
  State<HomeBannerSection> createState() => _HomeBannerSectionState();
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  int _currentIndex = 0;

  // final List<String> _imagePaths = [
  //   'assets/images/banner.png',
  //   'assets/images/banner.png',
  //   'assets/images/banner.png',
  // ];

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.watch<HomeCubit>();
    return BlocBuilder(
        bloc: homeCubit,
        builder: (context, snapshot) {
          return Column(
            children: [
              CarouselSlider(
                items: homeCubit.data.banners.map((path) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () async {
                          String linkType = path.linkType ?? "";
                          String url = path.linkValue ?? "";
                          if (linkType == "web") {
                            if (!await launchUrl(Uri.parse(url))) {
                              ToastUtil.showToastError(
                                  "", 'Could not launch $url');
                            }
                          } else if (linkType == "product") {}
                        },
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              path.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 160.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeCubit.data.banners.asMap().entries.map((entry) {
                  final bool isActive = _currentIndex == entry.key;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isActive ? 24.0 : 12.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        });
  }
}
