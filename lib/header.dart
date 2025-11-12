import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String teks;
  final TextStyle? style;
  const Header({super.key, required this.teks, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      color: Color.fromRGBO(48, 86, 105, 1),
      child: Text(
        teks,
        style:
            (style ??
            const TextStyle(
              color: Colors.white,
              letterSpacing: 5,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
