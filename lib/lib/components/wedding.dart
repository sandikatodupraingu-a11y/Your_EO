import 'package:flutter/material.dart';
import 'package:your_eo/components/detail.dart';

final List<Map<String, dynamic>> weddingPackages = [
  {
    'title': 'Garden Wedding',
    'price': 'Rp 55.000.000',
    'image': 'assets/wedding_1.jpg',
    'description': 'Pernikahan outdoor dengan dekorasi floral di taman terbuka, menciptakan suasana romantis dan natural.'
    ' Cocok untuk pasangan yang menyukai nuansa alam.',
    'facilities': ['Kapasitas 200 tamu', 'Venue taman', 'Pelaminan outdoor', 'Rias + busana pengantin', 'Catering 200 porsi']
  },
  {
    'title': 'Ballroom Wedding',
    'price': 'Rp 85.000.000',
    'image': 'assets/wedding_2.jpg',
    'description': 'Pernikahan mewah di ballroom hotel berbintang, dilengkapi tata cahaya elegan dan hiburan live.'
    ' Suasana formal dengan konsep modern klasik.',
    'facilities': ['Kapasitas 300 tamu', 'Ballroom + lighting', 'Dekorasi full pelaminan', 'Rias & busana 2 pasang', 'Buffet 300 porsi']
  },
  {
    'title': 'Intimate Wedding',
    'price': 'Rp 35.000.000',
    'image': 'assets/wedding_3.jpg',
    'description': 'Pernikahan sederhana dan hangat di cafe, villa, atau rumah pribadi. Suasana akrab namun tetap elegan.',
    'facilities': ['Kapasitas 100 tamu', 'Venue indoor/outdoor privat', 'Dekorasi simple elegant', 'Rias & busana pengantin', 'Catering 100 porsi']
  },
  {
    'title': 'Simple Wedding',
    'price': 'Rp 20.000.000',
    'image': 'assets/wedding_4.jpg',
    'description': 'Paket untuk acara akad nikah dengan dekorasi minimalis di masjid atau rumah.'
    ' Fokus pada kesakralan dan kesederhanaan.',
    'facilities': ['Kapasitas 100 tamu', 'Dekorasi akad minimalis', 'Rias pengantin', 'Konsumsi 100 pax', 'Sound system & dokumentasi']
  },
  {
    'title': 'Beach Wedding',
    'price': 'Rp 65.000.000',
    'image': 'assets/wedding_5.jpg',
    'description': 'Pernikahan di tepi pantai dengan suasana matahari terbenam dan iringan musik akustik.'
    ' Ideal untuk pasangan yang menyukai konsep tropical wedding.',
    'facilities': ['Kapasitas 150 tamu', 'Venue pantai & dekor tropis', 'Pelaminan minimalis', 'Busana & rias pengantin', 'Catering 150 porsi']
  },
];
class WeddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paket Wedding")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: weddingPackages.length,
        itemBuilder: (context, index) {
          final pkg = weddingPackages[index];
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
