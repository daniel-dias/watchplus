import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.name,
    required this.label,
    required this.year,
  });

  final String name;
  final String label;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 35, 56),
        border: Border.all(
          color: const Color.fromARGB(255, 143, 130, 153),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(color: Colors.white)),
          Row(
            children: [
              Text(label, style: const TextStyle(color: Colors.white)),
              Text(year, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
