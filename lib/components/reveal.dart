import 'package:flutter/material.dart';
import 'package:your_eo/components/detail.dart';

final List<Map<String, dynamic>> revealPackages = [
  {
    'title': 'Intimate Gender Reveal',
    'price': 'Rp 8.000.000',
    'image': 'assets/reveal_1.jpg',
    'description': 'Acara kecil bersama keluarga dan sahabat di cafe atau rumah dengan nuansa hangat.'
    ' Puncak acara diisi momen pembukaan balon atau smoke reveal.',
    'facilities': ['Kapasitas 30 orang', 'Dekorasi pink & biru', 'Kue & balon reveal', 'Snack & minuman ringan', 'MC']
  },
  {
    'title': 'Garden Reveal Party',
    'price': 'Rp 12.000.000',
    'image': 'assets/reveal_2.jpg',
    'description': 'Gender reveal di taman dengan suasana santai dan dekorasi romantis.'
    ' Dilengkapi spot foto dan aktivitas mini games.',
    'facilities': ['Kapasitas 50 orang', 'Lokasi outdoor + dekor tema', 'Mini games & MC', 'Snack table + cake', 'Smoke reveal / confetti']
  },
  {
    'title': 'Surprise Gender Box',
    'price': 'Rp 10.000.000',
    'image': 'assets/reveal_3.jpg',
    'description': 'Konsep acara kejutan dengan kotak besar yang dibuka di puncak acara. Dikemas secara emosional dan interaktif.',
    'facilities': ['Kapasitas 40 orang', 'Venue indoor/outdoor kecil', 'Giant reveal box', 'Dekorasi simple & balon', 'Snack & drink']
  },
  {
    'title': 'Glam Gender Reveal',
    'price': 'Rp 18.000.000',
    'image': 'assets/reveal_4.jpg',
    'description': 'Pesta gender reveal elegan di restoran atau cafe mewah. Cocok untuk pasangan yang ingin kemasan formal namun penuh kehangatan.',
    'facilities': ['Kapasitas 60 orang', 'Venue indoor eksklusif', 'Dekorasi mewah pink/blue', 'Catering lengkap', 'MC & dokumentasi']
  },
  {
    'title': 'Rooftop Gender Reveal',
    'price': 'Rp 17.000.000',
    'image': 'assets/reveal_5.jpg',
    'description': 'Acara gender reveal eksklusif di rooftop dengan panorama kota dan suasana senja yang hangat.'
    ' Acara gender reveal eksklusif di rooftop dengan panorama kota dan suasana senja yang hangat.',
    'facilities': ['Kapasitas 50 orang', 'Venue rooftop privat', 'Dekorasi balon & bunga pink/biru', 'Snack box & kue reveal', 'MC & musik akustik']
  },
];
class GenderRevealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paket Gender Reveal")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: revealPackages.length,
        itemBuilder: (context, index) {
          final pkg = revealPackages[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
                                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                              ),
                              builder: (_) => DetailSnackBar(
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
