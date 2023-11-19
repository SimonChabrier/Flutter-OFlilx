import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;

  const StarRating({Key? key, required this.rating, this.starSize = 24.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: starSize,
        ),
      ),
    );
  }
}
