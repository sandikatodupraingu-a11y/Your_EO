import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(Map<String, dynamic> item) {
    final existingIndex = _favorites.indexWhere((element) => element['title'] == item['title']);
    if (existingIndex != -1) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> item) {
    return _favorites.any((element) => element['title'] == item['title']);
  }
}
