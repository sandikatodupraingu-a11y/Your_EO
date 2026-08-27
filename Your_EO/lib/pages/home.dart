import 'package:flutter/material.dart';
import 'package:your_eo/components/popular.dart';
import 'package:your_eo/components/kategori.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Welcome 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity, 
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Event Organizer.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 400 ? 16 : 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Platform untuk Booking Event Organizer.\nTemukan paket yang sesuai untuk acara spesial Anda!',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 400 ? 13 : 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Text(
              'Kategori Acara',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CategoryList(categories: eventCategories),

            const SizedBox(height: 24),
            const Text(
              'Popular Paket',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            PopularPackages()
          ],
        ),
      ),
    );
  }
}
