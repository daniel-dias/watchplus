import 'package:flutter/material.dart';

class Source extends StatelessWidget {
  const Source({
    super.key,
    required this.text,
    required this.sourceUrl,
  });

  final String text;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 35, 56),
        border: Border.all(
          color: const Color.fromARGB(255, 143, 130, 153),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/placeholder.png',
            width: 75,
            height: 75,
          ),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
