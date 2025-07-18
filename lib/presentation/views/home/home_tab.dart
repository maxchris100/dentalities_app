import 'package:dentalities/presentation/widgets/bundling_product.dart';
import 'package:dentalities/presentation/widgets/checkout_reminder.dart';
import 'package:dentalities/presentation/widgets/home_testimony.dart';
import 'package:dentalities/presentation/widgets/new_arrival_product.dart';
import 'package:dentalities/presentation/widgets/today_discount.dart';
import 'package:dentalities/presentation/widgets/top_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/feature_product.dart';
import 'package:dentalities/presentation/widgets/recommended_product.dart';
import 'package:dentalities/presentation/widgets/top_collection.dart';
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
    });
  }

  ProfileCubit profileCubit = ProfileCubit();
  void getData() async {
    try {} catch (ex) {}
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.watch<AuthCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => profileCubit),
      ],
      child: Scaffold(
        body: ListView(
          controller: scrollController,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.spaceBetween,
                children: const [
                  _CategoryItem(
                      'assets/icons/home_icon.svg', 'General\nDentistry'),
                  _CategoryItem('assets/icons/home_icon.svg', 'Endodontics'),
                  _CategoryItem('assets/icons/home_icon.svg', 'Endodontics'),
                  _CategoryItem('assets/icons/home_icon.svg', 'Endodontics'),
                  _CategoryItem('assets/icons/home_icon.svg', 'Endodontics'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue[50],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SvgPicture.asset("assets/icons/home_dental.svg"),
                      SizedBox(width: 8),
                      Text('What are you looking for?',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 5,
                      runSpacing: 0,
                      children: [
                        _FilterChip(
                            'All product', Icons.space_dashboard_outlined),
                        _FilterChip('My speciality products', Icons.star),
                        _FilterChip('Promotions', Icons.local_offer),
                        _FilterChip(
                            'Product videos', Icons.play_circle_outline),
                        _FilterChip('Doctor testimonials', Icons.chat_bubble),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            FeatureProductSection(),
            const SizedBox(height: 24),
            TodaysDiscountSection(),
            SizedBox(
              height: 20,
            ),
            BundlingProductSection(),
            SizedBox(
              height: 20,
            ),
            NewArrivalProductSection(),
            SizedBox(
              height: 20,
            ),
            TopBrandSection(),
            SizedBox(
              height: 20,
            ),
            CheckoutReminderSection(),
            SizedBox(
              height: 20,
            ),
            HomeTestimonialSection(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () {
                    scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInBack);
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
        SvgPicture.asset(image, width: 48, height: 48),
        const SizedBox(height: 6),
        Text(title,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _FilterChip(this.label, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.blue),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}
