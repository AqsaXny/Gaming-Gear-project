import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int hati; // 0..5
  final Color color;
  const Rating({super.key, required this.hati, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    final deret = List.generate(5, (i) => i + 1);
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: deret.map((h) {
          final filled = h <= hati;
          return Icon(
            filled ? Icons.favorite : Icons.favorite_border,
            size: 18,
            color: color,
          );
        }).toList(),
      ),
    );
  }
}
