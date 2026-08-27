import 'package:flutter/material.dart';
import 'package:your_eo/components/detail.dart';

final List<Map<String, dynamic>> birthdayPackages = [
  {
    'title': 'Kids Birhday Fun',
    'price': 'Rp 9.000.000',
    'image': 'assets/birthday_1.jpg',
    'description':
        'Pesta ulang tahun anak di taman atau area indoor tematik dengan karakter favorit.'
        ' Acara dikemas meriah dengan badut, permainan, dan makanan anak-anak.',
    'facilities': [
      'Kapasitas 30 anak',
      'Dekorasi tema anak',
      'Badut & MC',
      'Kue ulang tahun & snack',
      'Games & doorprize',
    ],
  },
  {
    'title': 'Sweet Seventeen Chic',
    'price': 'Rp 22.000.000',
    'image': 'assets/birthday_2.jpg',
    'description':
        'Ulang tahun ke-17 yang diselenggarakan di cafe atau ballroom kecil dengan nuansa glamor.'
        ' Suasana dimeriahkan dengan red carpet, photobooth, dan live music.',
    'facilities': [
      'Kapasitas 70 orang',
      'Venue indoor',
      'Dekorasi sweet 17',
      'DJ/live music & MC',
      'Buffet + birthday cake',
    ],
  },
  {
    'title': 'Private Birthday Dinner',
    'price': 'Rp 35.000.000',
    'image': 'assets/birthday_3.jpg',
    'description':
        'Perayaan ulang tahun dewasa di rooftop hotel atau lounge dengan suasana hangat dan eksklusif.'
        ' Diiringi musik akustik, acara berlangsung santai dan elegan.',
    'facilities': [
      'Kapasitas 40 orang',
      'Venue rooftop',
      'Set dinner menu',
      'Dekorasi elegant',
      'Live acoustic & MC',
    ],
  },
  {
    'title': 'Birthday Picnic',
    'price': 'Rp 16.000.000',
    'image': 'assets/birthdayy_4.jpg',
    'description':
        'Pesta ulang tahun dengan konsep piknik di taman, dikelilingi dekorasi rustic dan makanan ringan.'
        ' Cocok untuk perayaan intim bersama teman-teman dekat.',
    'facilities': [
      'Kapasitas 35 orang',
      'Lokasi taman outdoor',
      'Tikar, bean bag & dekorasi',
      'Snack & BBQ ringan',
      'MC santai & mini games',
    ],
  },
  {
    'title': 'Birthday Costume Party',
    'price': 'Rp 20.000.000',
    'image': 'assets/birthdayy_5.jpg',
    'description':
        'Ulang tahun bertema kostum seru dengan venue dekoratif dan permainan tematik.'
        ' Acara dimeriahkan oleh lomba kostum dan photobooth unik.',
    'facilities': [
      'Kapasitas 60 orang',
      'Venue indoor',
      'MC & lomba kostum',
      'Buffet & cake',
      'Photobooth & souvenir',
    ],
  },
];

class BirthdayPartyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paket Birthday Party")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: birthdayPackages.length,
        itemBuilder: (context, index) {
          final pkg = birthdayPackages[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    pkg['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pkg['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pkg['price'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              builder:
                                  (_) => DetailSnackBar(
                                    title: pkg['title'],
                                    price: pkg['price'],
                                    image: pkg['image'],
                                    description: pkg['description'],
                                    facilities: pkg['facilities'],
                                  ),
                            );
                          },
                          child: const Text('Detail'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
