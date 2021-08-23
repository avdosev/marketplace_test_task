import 'package:flutter/cupertino.dart';

class CatalogItem {
  final List<Color> colors;
  final String name;
  final int price;
  final String imagePath;

  const CatalogItem({
    required this.colors,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}
