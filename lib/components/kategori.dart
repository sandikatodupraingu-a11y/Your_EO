import 'package:flutter/material.dart';
import 'package:your_eo/components/birthday.dart';
import 'package:your_eo/components/company.dart';
import 'package:your_eo/components/reveal.dart';
import 'package:your_eo/components/wedding.dart';

final List<Map<String, dynamic>> eventCategories = [
  {
    'title': 'Company Gathering',
    'icon': Icons.business,
    'page': CompanyGatheringPage(),
  },
  {
    'title': 'Birthday Party',
    'icon': Icons.cake,
    'page': BirthdayPartyPage(),
  },
  {
    'title': 'Wedding',
    'icon': Icons.favorite,
    'page': WeddingPage(),
  },
  {
    'title': 'Gender Reveal',
    'icon': Icons.child_care,
    'page': GenderRevealPage(),
  },
];

class CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: categories.map((category) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => category['page']),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        ),
                        child: Icon(
                          category['icon'],
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 32,
                        child: Text(
                          category['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

