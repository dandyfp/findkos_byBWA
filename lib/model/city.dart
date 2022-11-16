import 'package:flutter/material.dart';

class City {
  int id;
  String name;
  String imageUrl;
  bool isPopuler;
  City(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.isPopuler});
}
