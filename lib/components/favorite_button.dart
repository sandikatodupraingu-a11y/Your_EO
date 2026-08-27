import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_eo/components/favorite_model.dart';

class FavoriteButton extends StatelessWidget {
  final Map<String, dynamic> item;

  const FavoriteButton({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteModel>(
      builder: (context, favoriteModel, _) {
        final isFavorited = favoriteModel.isFavorite(item);
        return IconButton(
          icon: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: isFavorited ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            favoriteModel.toggleFavorite(item);
          },
        );
      },
    );
  }
}
