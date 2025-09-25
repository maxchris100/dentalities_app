import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/util/toast_util.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/recent_search.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/product_cubit.dart';
import 'package:dentalities/presentation/widgets/filter_bar.dart';
import 'package:dentalities/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode searchFocus = FocusNode();
  TextEditingController searchController = TextEditingController();

  bool isSearched = false;
  HomeCubit? homeCubit;

  Map<String, Category> initSelectedCategories = {};
  Map<String, Brand> initSelectedBrands = {};
  String? selectedCategories;
  String? selectedBrands;
  String? selectedSort;
  int? selectedNewArrival;
  int? selectedOnPromo;
  int? selectedReadyStock;

  late ProductCubit productCubit;
  late ScrollController _scrollController;

  bool isLoadingMore = false;
  int _currentPage = 1;
  final int _limit = 20;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    productCubit = ProductCubit();

    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!isLoadingMore && _hasMore) {
          setState(() {
            isLoadingMore = true;
          });
          _currentPage++;

          final newProducts = await productCubit.getSearchProduct(
              searchController.text.trim(),
              categories: selectedCategories,
              brands: selectedBrands,
              sort: selectedSort,
              newArrival: selectedNewArrival,
              onPromo: selectedOnPromo,
              readyStock: selectedReadyStock,
              page: _currentPage,
              limit: _limit,
              loadMore: true);

          if (newProducts.isEmpty) {
            // Tidak ada produk baru
            _hasMore = false;
          }
          setState(() {
            isLoadingMore = false;
          });
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      String slug = args?['categoryslug'] ?? "";
      Brand? brand = args?['brand'];
      Category? category = args?['category'];
      int? newArrival = args?['is_new'];

      selectedNewArrival = newArrival;
      selectedBrands = brand?.id.toString();
      selectedCategories = category?.id.toString();

      if (brand != null) {
        initSelectedBrands[brand.id.toString()] = brand;
      }
      if (category != null) {
        initSelectedCategories[category.id.toString()] = category;
      }
      productCubit.getProductByCategorySlug(slug);
      productCubit.getSearchProduct(searchController.text.trim(),
          brands: brand?.id.toString(),
          categories: category?.id.toString(),
          newArrival: newArrival);

      if (args != null) {
        if (args["search_focus"] == 1) {
          searchFocus.requestFocus();
        }
      }

      getRecentSearch();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        homeCubit = context.read<HomeCubit>();
      });
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                            FilterBar(
                              initSelectedCategories: initSelectedCategories,
                              initSelectedBrands: initSelectedBrands,
                              onFilterChanged: (String p0, String p1,
                                  {String? sort,
                                  int? newArrival,
                                  int? onPromo,
                                  int? readyStock}) {
                                selectedCategories = p0;
                                selectedBrands = p1;
                                selectedSort = sort;
                                selectedNewArrival = newArrival;
                                selectedOnPromo = onPromo;
                                selectedReadyStock = readyStock;
                                productCubit.getSearchProduct(
                                    searchController.text.trim(),
                                    categories: p0,
                                    brands: p1,
                                    sort: sort,
                                    newArrival: newArrival,
                                    onPromo: onPromo,
                                    readyStock: readyStock);
                              },
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                                child: state is ProductError
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SingleChildScrollView(
                                        controller: _scrollController,
                                        child: Column(
                                          children: [
                                            GridView.count(
                                              crossAxisCount: 2,
                                              padding: const EdgeInsets.all(12),
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 16,
                                              childAspectRatio:
                                                  0.6, // sesuaikan tinggi/lebarnya
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(), // kalau sudah dalam scroll view
                                              children: productCubit
                                                  .data.listProduct
                                                  .map((product) {
                                                return ProductCard(
                                                    product: product);
                                              }).toList(),
                                            ),
                                            if (isLoadingMore)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                          ],
                                        ),
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
                                "assets/icons/home_wishlist.svg",
                                "Wishlist",
                                1)),
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
}
