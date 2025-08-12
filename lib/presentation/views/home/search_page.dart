import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/recent_search.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/widgets/filter_bar.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode searchFocus = FocusNode();
  TextEditingController searchController = TextEditingController();

  bool isSearched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productCubit = ProductCubit();
    // Tunggu sampai context ready

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      String slug = args?['categoryslug'] ?? "";
      productCubit.getProductByCategorySlug(slug);
      productCubit.getSearchProduct(null);

      if (args != null) {
        if (args["search_focus"] == 1) {
          searchFocus.requestFocus();
        }
      }

      getRecentSearch();
    });
  }

  // final products = [
  //   Product(
  //     name: "Test",
  //     // title: 'PureOffice Professional Intracanal Dental Whiten...',
  //     // brand: Brand(name: ""),
  //     // image: 'assets/images/banner.png',
  //     price: 107000,
  //     // oldPrice: 'Rp1.189.000',
  //     // badge: 'New arrival 10%',
  //   ),
  //   Product(name: ""),
  // ];

  List<RecentSearch> recentSearch = [];
  List<String> recentSearchProducts = [];
  void getRecentSearch() {
    Constant.getRecentSearch().then((value) {
      recentSearch = value;

      var list = recentSearch
          .where((e) => e.type == RecentSearchType.product.toString())
          .map((e) => e.name)
          .toList();
      recentSearchProducts.addAll(list);
      setState(() {});
    });
  }

  late ProductCubit productCubit;

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments as Map?;
    // String slug = args?['categoryslug'] ?? "";

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
              appBar: AppBar(
                actions: [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextField(
                        focusNode: searchFocus,
                        textInputAction: TextInputAction.search,
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: 'Search product',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              isSearched = false;
                            });
                          } else {
                            setState(() {
                              isSearched = true;
                            });
                          }
                        },
                        onSubmitted: (value) async {
                          print("@value");
                          setState(() {
                            isSearched = true;
                          });
                          RecentSearch p = RecentSearch(
                              name: value,
                              type: RecentSearchType.product.toString());
                          await Constant.saveRecentSearch(p);
                          recentSearchProducts.add(p.name);
                          recentSearch.add(p);
                          productCubit.getSearchProduct(value.trim());
                          setState(() {});
                          //search
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRouter.cart);
                          },
                          child: Icon(Icons.shopping_cart_outlined))),
                  Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRouter.notification);
                          },
                          child: Icon(Icons.notifications_none)))
                ],
              ),
              body: SafeArea(
                  child: Stack(
                children: [
                  state is ProductLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            Visibility(
                                visible: searchFocus.hasFocus &&
                                    !isSearched &&
                                    searchController.text.isNotEmpty,
                                child: SizedBox(
                                  height: 200,
                                )),
                            FilterBar(),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                                child: GridView.count(
                              crossAxisCount: 2,
                              padding: const EdgeInsets.all(12),
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 16,
                              childAspectRatio:
                                  0.6, // sesuaikan tinggi/lebarnya
                              shrinkWrap: true,
                              physics:
                                  NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
                              children:
                                  productCubit.data.listProduct.map((product) {
                                return ProductCard(product: product);
                              }).toList(),
                            )),
                          ],
                        ),
                  Visibility(
                    visible: searchFocus.hasFocus &&
                        !isSearched &&
                        searchController.text.isNotEmpty,
                    child: Container(
                      height: 200,
                      color: Colors.white,
                      child: ListView.separated(
                        itemCount: recentSearchProducts.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final productSearched = recentSearchProducts[index];
                          final isHistory = index >= 4;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                searchController.text = productSearched;
                                productCubit.getSearchProduct(null);
                                searchFocus.unfocus();
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  // SvgPicture.asset(
                                  //   isHistory
                                  //       ? 'assets/icons/search.svg'
                                  //       : 'assets/icons/search.svg',
                                  // ),
                                  Icon(Icons.search, color: Colors.grey),
                                  const SizedBox(width: 20),
                                  Expanded(
                                      child: Text(productSearched,
                                          style:
                                              const TextStyle(fontSize: 15))),
                                  // if (isHistory)
                                  GestureDetector(
                                    onTap: () async {
                                      final recent = RecentSearch(
                                        name: productSearched,
                                        type:
                                            RecentSearchType.product.toString(),
                                      );
                                      await Constant.removeRecentSearch(recent);
                                      recentSearchProducts.removeAt(index);
                                    },
                                    child: const Icon(Icons.close,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}
