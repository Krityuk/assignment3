import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title; //this is item shown in first page of app
  final String description;
  final String imageUrl;
  final String X;
  final int Y;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.X,
    required this.Y,
    this.isFavourite = false,
  });

  // void toggleFavorite() {
  //   isFavourite = !isFavourite;
  //   // print("this item is favorite - $isFavourite");
  //   notifyListeners();
  // }
}
