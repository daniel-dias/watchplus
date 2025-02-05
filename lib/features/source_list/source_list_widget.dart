import 'package:flutter/material.dart';
import '../source/source_widget.dart';

class SourceList extends StatelessWidget {
  const SourceList({
    super.key,
    required this.title,
    required this.sources,
  });

  final String title;
  final List<Source> sources;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: sources,
            ),
          ),
        ],
      ),
    );
  }
}
