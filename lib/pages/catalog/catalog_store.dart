import 'dart:math';
import 'dart:ui';

import 'package:marketplace/models/catalog_item.dart';

final _colors = [
  Color(0xFFB2A39D),
  Color(0xFFE4B34C),
  Color(0xFF9A9E9F),
  Color(0xFF505C72),
];

final _rnd = Random();

List<Color> _genColors() {
  return (_colors.toList()..shuffle(_rnd)).sublist(0, 3);
}

class CatalogStore {
  List<CatalogItem> items = [
    CatalogItem(
      colors: _genColors(),
      name: 'Диван 1',
      price: 34023,
      imagePath: 'assets/market_data/1111.png',
    ),
    CatalogItem(
      colors: _genColors(),
      name: 'Диван 2',
      price: 14023,
      imagePath: 'assets/market_data/1112.png',
    ),
    CatalogItem(
      colors: _genColors(),
      name: 'Диван 3',
      price: 64023,
      imagePath: 'assets/market_data/1113.png',
    ),
    CatalogItem(
      colors: _genColors(),
      name: 'Диван 4',
      price: 94023,
      imagePath: 'assets/market_data/1114.png',
    ),
  ];
}
