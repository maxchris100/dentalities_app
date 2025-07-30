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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeCubit homeCubit = context.read<HomeCubit>();
      homeCubit.init();

      CartCubit cartCubit = context.read<CartCubit>();
      cartCubit.fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              child: Stack(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.cart);
                      },
                      child: Icon(Icons.shopping_cart_outlined)),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ))
                ],
              )),
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: Stack(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.notification);
                      },
                      child: Icon(Icons.notifications_none)),
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
      body: _pages[_selectedIndex],
      // drawer: const AppDrawer(selectedMenu: "Homepage"),
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10), // ↓ Turunkan sedikit ke bawah
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
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
                  color: _selectedIndex == 2 ? Colors.white : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                offset:
                    Offset(0, -2), // arah bayangan ke atas (karena dari bawah)
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
                        _selectedIndex == 0
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
                        "assets/icons/home_transaction.svg", "Transaction", 3)),
                Expanded(
                    child: _buildNavItem(
                        "assets/icons/home_profile.svg", "Profile", 4)),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Color(0xff0C73C7),
      //   unselectedItemColor: Colors.grey,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   backgroundColor: Colors.white,
      //   unselectedLabelStyle: TextStyle(fontSize: 10),
      //   selectedLabelStyle: TextStyle(fontSize: 10),
      //   elevation: 12,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         "assets/icons/home_home.svg",
      //         color: _selectedIndex == 0 ? Colors.blue : null,
      //       ),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         "assets/icons/home_wishlist.svg",
      //         color: _selectedIndex == 1 ? Colors.blue : null,
      //       ),
      //       label: "Wishlist",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         "assets/icons/home_cs.svg",
      //         color: _selectedIndex == 2 ? Colors.blue : null,
      //       ),
      //       label: "CS",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         "assets/icons/home_transaction.svg",
      //         color: _selectedIndex == 3 ? Colors.blue : null,
      //       ),
      //       label: "Transaction",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(
      //         "assets/icons/home_profile.svg",
      //         color: _selectedIndex == 4 ? Colors.blue : null,
      //       ),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final isSelected = _selectedIndex == index;
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
