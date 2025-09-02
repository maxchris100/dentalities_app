import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/profile_cubit.dart';
import 'package:dentalities/presentation/widgets/home/feature_product.dart';
import 'package:dentalities/presentation/widgets/recommended_product.dart';
import 'package:dentalities/presentation/widgets/home/top_collection.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  void initState() {
    super.initState();
    productCubit = ProductCubit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productCubit.getSearchProduct(null);
      // getData();
      FocusScope.of(context).unfocus();
    });
  }

  late ProductCubit productCubit;
  void getData() async {
    try {} catch (ex) {}
  }

  final products = [
    Product(
      name: "Test",
      // title: 'PureOffice Professional Intracanal Dental Whiten...',
      // brand: Brand(name: ""),
      // image: 'assets/images/banner.png',
      price: 107000,
      // oldPrice: 'Rp1.189.000',
      // badge: 'New arrival 10%',
    ),
    Product(name: ""),
  ];
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    AuthCubit authCubit = context.watch<AuthCubit>();
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => productCubit,
          ),
        ],
        child: BlocBuilder<ProductCubit, ProductState>(
            bloc: productCubit,
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Container(
                          child: Stack(children: [
                        Image.asset("assets/images/save_more_bundling.png"),
                        Positioned(
                            left: 12,
                            top: 8,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Acteon",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white)),
                                  Text("France",
                                      style: TextStyle(color: Colors.white))
                                ]))
                      ])),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(12),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.6, // sesuaikan tinggi/lebarnya
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
                        children: productCubit.data.listProduct.map((product) {
                          return ProductCard(product: product);
                        }).toList(),
                      ),
                    )),
                  ],
                )),
              );
            }));
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
      color: Color(0xFFE0E0E0),
    );
  }
}
