import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key, this.index, this.rating});
  final index;
  final rating;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'asset/icon_stars.png' : 'asset/iconlove.png',
      width: 20,
    );
  }
}
