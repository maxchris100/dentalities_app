import 'package:dentalities/presentation/blocs/cubit/cart_cubit.dart';
import 'package:dentalities/presentation/blocs/cubit/home_cubit.dart';
import 'package:dentalities/presentation/views/index/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/views/index/cart_tab.dart';
import 'package:dentalities/presentation/views/index/home_tab.dart';
import 'package:dentalities/presentation/views/index/profile_tab.dart';
import 'package:dentalities/presentation/views/index/cs_tab.dart';
import 'package:dentalities/presentation/widgets/app_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const WishlistTab(),
    const CSTab(),
    const CartTab(),
    const ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  HomeCubit homeCubit = HomeCubit();
  CartCubit cartCubit = CartCubit();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => homeCubit..init()),
        BlocProvider(create: (context) => cartCubit..fetchCart()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dentalities",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          // leading: Builder(builder: (context) {
          //   return GestureDetector(
          //       onTap: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       child: const Icon(Icons.menu));
          // }),
          actions: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search product',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.search);
                  },
                  // enabled: false,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.cart);
                    },
                    child: Icon(Icons.shopping_cart_outlined))),
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.notification);
                    },
                    child: Icon(Icons.notifications_none)))
          ],
        ),
        body: _pages[_selectedIndex],
        // drawer: const AppDrawer(selectedMenu: "Homepage"),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff0C73C7),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedLabelStyle: TextStyle(fontSize: 10),
          elevation: 12,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_home.svg",
                color: _selectedIndex == 0 ? Colors.blue : null,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_wishlist.svg",
                color: _selectedIndex == 1 ? Colors.blue : null,
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_cs.svg",
                color: _selectedIndex == 2 ? Colors.blue : null,
              ),
              label: "CS",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_transaction.svg",
                color: _selectedIndex == 3 ? Colors.blue : null,
              ),
              label: "Transaction",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home_profile.svg",
                color: _selectedIndex == 4 ? Colors.blue : null,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
