import 'package:flutter/material.dart';
import 'package:your_eo/components/wedding.dart';
import 'package:your_eo/components/birthday.dart';
import 'package:your_eo/components/company.dart';
import 'package:your_eo/components/reveal.dart';

class KategoriPage extends StatelessWidget {
  final List<Map<String, String>> kategoriList = [
    {"nama": "Company Gathering", "image": "assets/company.jpg"},
    {"nama": "Birthday Party", "image": "assets/birthday.jpg"},
    {"nama": "Wedding", "image": "assets/wedding.jpg"},
    {"nama": "Gender Reveal", "image": "assets/reveal.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kategoriList.length + 1, // +1 untuk judul di atas
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Kategori Paket',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          // Data item dimulai dari index - 1
          final kategori = kategoriList[index - 1];
          Widget destinationPage;

          switch (kategori['nama']) {
            case "Wedding":
              destinationPage = WeddingPage();
              break;
            case "Birthday Party":
              destinationPage = BirthdayPartyPage();
              break;
            case "Company Gathering":
              destinationPage = CompanyGatheringPage();
              break;
            case "Gender Reveal":
              destinationPage = GenderRevealPage();
              break;
            default:
              destinationPage = const Scaffold(
                body: Center(child: Text('Halaman belum tersedia')),
              );
          }

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => destinationPage),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      kategori['image']!,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          kategori['nama']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}