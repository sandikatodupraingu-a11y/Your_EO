import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_eo/components/favorite_model.dart';
import 'package:your_eo/components/form.dart';

class DetailSnackBar extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String description;
  final List<String> facilities;

  const DetailSnackBar({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.facilities,
  });

  @override
  Widget build(BuildContext context) {
    final package = {
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'facilities': facilities,
    };

    final favModel = Provider.of<FavoriteModel>(context);
    final isFav = favModel.isFavorite(package);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      builder: (context, controller) => SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, height: 180, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(price, style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 12),
              Text('Deskripsi', style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(description),
              const SizedBox(height: 12),
              Text('Fasilitas', style: const TextStyle(fontWeight: FontWeight.w600)),
              Wrap(spacing: 8, runSpacing: 2, children: facilities.map((f) => Chip(label: Text(f))).toList()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      favModel.toggleFavorite(package);
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : null,
                    ),
                    label: Text(isFav ? 'Favorit' : 'Favorit'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FormBookingPage(paket: title),
                        ),
                      );
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Booking'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
