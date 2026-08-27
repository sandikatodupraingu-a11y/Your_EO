import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_eo/components/favorite_model.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteModel>().favorites;

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all( 18),
              child: Text(
                'Paket Favorit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: favorites.isEmpty
                  ? const Center(child: Text('Belum ada paket favorit.'))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item['image'],
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item['price'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      if (item['facilities'] != null)
                                        Wrap(
                                          spacing: 4,
                                          runSpacing: 2,
                                          children: (item['facilities'] as List<dynamic>)
                                              .map((f) => Chip(label: Text(f, style: const TextStyle(fontSize: 12))))
                                              .toList(),
                                        ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton.icon(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => CupertinoAlertDialog(
                                                title: const Text("Konfirmasi"),
                                                content: const Text("Hapus dari favorit?"),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: const Text("Batal"),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  CupertinoDialogAction(
                                                    isDestructiveAction: true,
                                                    child: const Text("Hapus"),
                                                    onPressed: () {
                                                      context.read<FavoriteModel>().toggleFavorite(item);
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                          label: const Text("Hapus", style: TextStyle(color: Colors.red)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
      ),
    );
  }
}
