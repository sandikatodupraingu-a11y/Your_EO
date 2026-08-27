import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Function(int) onSelectPage;

  const DrawerMenu({super.key, required this.onSelectPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color(0xff8d4e2a)),
                  child: Text(
                    'YourEO Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    onSelectPage(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Kategori'),
                  onTap: () {
                    Navigator.pop(context);
                    onSelectPage(1);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorite'),
                  onTap: () {
                    Navigator.pop(context);
                    onSelectPage(2);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Booking Saya'),
                  onTap: () {
                    Navigator.pop(context);
                    onSelectPage(3);
                  },
                ),
              ],
            ),
          ),

          const Divider(), 

          SafeArea(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
