import 'package:flutter/material.dart';

class ItemWisata extends StatelessWidget {
  final String teks;
  final String gambarAssetPath;
  const ItemWisata({
    super.key,
    required this.teks,
    required this.gambarAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(teks, style: const TextStyle(fontSize: 16)),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(gambarAssetPath, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
