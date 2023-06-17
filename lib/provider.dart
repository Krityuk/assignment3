import 'package:flutter/material.dart';

import 'models/Product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'LIFESTYLE',
      X: '16 lessons',
      Y: 1,
      description: 'A complete guide for your new born baby',
      imageUrl: 'images/p1.png',
    ),
    Product(
      id: 'p2',
      title: 'BABYCARE',
      X: '13 Feb, Sunday',
      Y: 2,
      description: 'Understanding of human behaviour',
      imageUrl: 'images/p2.png',
    ),
    Product(
      id: 'p3',
      title: 'BABYCARE',
      X: '3 min',
      Y: 3,
      description: 'Understanding of human behaviour',
      imageUrl: 'images/p2.png',
    ),
  ];
  final isFavoriteTapped = false;

  List<Product> get items {
    if (isFavoriteTapped) {
      return _items.where((product) => product.isFavourite).toList();
    } //above line means return that prod only in which product.isFavourite is
    return [..._items];
  }

  Product findById(String productId) {
    // this func returns a product object
    return _items.firstWhere((p) => p.id == productId);
  }
}
