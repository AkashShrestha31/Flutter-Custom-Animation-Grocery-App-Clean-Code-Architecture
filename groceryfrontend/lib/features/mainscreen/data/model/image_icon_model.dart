import 'package:flutter/material.dart';

class ImageAndIconModel {
  final String image;
  final String title;
  final String category;
  final int price;
  ImageAndIconModel(this.category, this.price, {required this.image, required this.title});
}
