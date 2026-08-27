import 'package:flutter/material.dart';
import 'package:your_eo/components/detail.dart';

final List<Map<String, dynamic>> companyPackages = [
  {
    'title': 'Fun Day Outdoor',
    'price': 'Rp 15.000.000',
    'image': 'assets/company_1.jpg',
    'description': 'Kegiatan gathering sehari penuh di area terbuka seperti hutan pinus atau taman wisata'
    ' Acara dikemas dengan permainan kelompok yang mendorong kekompakan dan relaksasi.',
    'facilities': ['Kapasitas 50 orang', 'Tempat outdoor privat', 'Ice breaking', 'MC & Fasilitator', 'Makan siang & snack']
  },
  {
    'title': 'Indoor Team Boost',
    'price': 'Rp 18.000.000',
    'image': 'assets/company_2.jpg',
    'description': 'Acara diadakan dalam ruangan seperti ballroom atau aula, cocok untuk membangun kerja tim dengan suasana profesional.'
    ' Aktivitas dikemas secara interaktif dengan games dan sesi motivasi.',
    'facilities': ['Kapasitas 60 orang', 'Sewa ruangan full AC', 'Trainer & MC', 'Konsumsi', 'Games & simulasi teamwork',]
  },
  {
    'title': 'Outing Wisata Ceria',
    'price': 'Rp 25.000.000',
    'image': 'assets/company_3.jpg',
    'description': 'Perjalanan rekreasi ke destinasi wisata seperti pantai atau taman edukatif, dikombinasikan dengan acara santai dan permainan ringan.'
    ' Suasana informal dan menyenangkan bagi seluruh tim.',
    'facilities': ['Kapasitas 50 orang', 'Transport & tiket masuk', 'Konsumsi full day', 'Kaos seragam', 'Games & doorprize']
  },
  {
    'title': 'Retreat Alam',
    'price': 'Rp 35.000.000',
    'image': 'assets/company_4.jpg',
    'description': 'Program 2 hari 1 malam di area pegunungan atau villa alam terbuka.'
    ' Cocok untuk penyegaran tim dengan sesi refleksi, motivasi, dan hiburan malam.',
    'facilities': [' Kapsitas 40 orang', 'Akomodasi 2H1M', 'Konsumsi', 'Sesi Motivasi & games', 'BBQ & api unggun']
  },
  {
    'title': 'Gala Dinner Appreciation',
    'price': 'Rp 15.000.000',
    'image': 'assets/company_5.jpg',
    'description': 'Acara malam formal di ballroom hotel dengan suasana mewah, menampilkan apresiasi terhadap karyawan dan hiburan live.'
    ' Formatnya elegan, penuh penghargaan dan hiburan.',
    'facilities': ['Kapasitas 100 orang', 'Venue ballroom', 'Gala dinner & MC', 'Live music & photobooth', 'Sesi penghargaan & hadiah']
  },
];

class CompanyGatheringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paket Company Gathering")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: companyPackages.length,
        itemBuilder: (context, index) {
          final pkg = companyPackages[index];
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
