import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String selectedMenu;

  const AppDrawer({super.key, required this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/images/avatar.png"), // Ganti dengan path kamu
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Sunie Pham",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("sunieux@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // Menu Items
            _buildMenuItem(context, Icons.home_outlined, "Homepage"),
            _buildMenuItem(context, Icons.search, "Discover"),
            _buildMenuItem(context, Icons.shopping_bag_outlined, "My Order"),
            _buildMenuItem(context, Icons.person_outline, "My profile"),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("OTHER",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),

            _buildMenuItem(context, Icons.settings_outlined, "Setting"),
            _buildMenuItem(context, Icons.mail_outline, "Support"),
            _buildMenuItem(context, Icons.info_outline, "About us"),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label) {
    final isSelected = label == selectedMenu;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.black : Colors.grey),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
      tileColor: isSelected ? Colors.grey.shade200 : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: () {
        // Ganti halaman jika ingin
        Navigator.pop(context);
      },
    );
  }
}
