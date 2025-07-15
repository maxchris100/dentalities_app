import 'package:flutter/material.dart';
import 'package:foriyana_app/core/router/app_router.dart';
import 'package:foriyana_app/presentation/views/home/cart_tab.dart';
import 'package:foriyana_app/presentation/views/home/home_tab.dart';
import 'package:foriyana_app/presentation/views/home/profile_tab.dart';
import 'package:foriyana_app/presentation/views/home/search_tab.dart';
import 'package:foriyana_app/presentation/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const SearchTab(),
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
        title:
            const Text("M-Mart", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu));
        }),
        actions: [
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
      drawer: const AppDrawer(selectedMenu: "Homepage"),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
