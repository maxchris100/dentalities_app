import 'package:dentalities/presentation/views/home/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/views/home/cart_tab.dart';
import 'package:dentalities/presentation/views/home/home_tab.dart';
import 'package:dentalities/presentation/views/home/profile_tab.dart';
import 'package:dentalities/presentation/views/home/cs_tab.dart';
import 'package:dentalities/presentation/widgets/app_drawer.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.all(8.0),
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_wishlist.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_wishlist.svg"),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_cs.svg"),
            label: "CS",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_transaction.svg"),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home_profile.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
