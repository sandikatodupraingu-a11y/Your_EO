import 'package:flutter/material.dart';
import 'package:your_eo/components/company.dart';
import 'package:your_eo/components/birthday.dart';
import 'package:your_eo/components/wedding.dart';
import 'package:your_eo/components/reveal.dart';
import 'package:your_eo/components/detail.dart';


class PopularPackages extends StatelessWidget {
  PopularPackages({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> allPackages = [
    ...weddingPackages,
    ...birthdayPackages,
    ...revealPackages,
    ...companyPackages,
  ];

  final List<String> popularTitles = [
    'Fun Day Outdoor',
    'Outing Wisata Ceria',
    'Sweet Seventeen Chic',
    'Private Birthday Dinner',
    'Intimate Wedding',
    'Beach Wedding',
    'Glam Gender Reveal',
    'Garden Reveal Party',
  ];

  List<Map<String, dynamic>> get popularPackages {
    return allPackages.where((pkg) => popularTitles.contains(pkg['title'])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: popularPackages.map((package) {
        return PopularPackageCard(
          title: package['title'],
          price: package['price'],
          image: package['image'],
          description: package['description'] ?? '', 
          facilities: List<String>.from(package['facilities'] ?? []),
        );
      }).toList(),
    );
  }
}

class PopularPackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String description;
  final List<String> facilities;

  const PopularPackageCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.facilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (_) => DetailSnackBar(
                          title: title,
                          price: price,
                          image: image,
                          description: description,
                          facilities: facilities,
                        ),
                      );
                    },
                    child: const Text('Detail'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
