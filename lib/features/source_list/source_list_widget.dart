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
          // SizedBox(
          //   height: 150,
          //   width: double.infinity,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     itemCount: sources.length,
          //     itemBuilder: (context, index) {
          //       return sources[index];
          //     },
          //     separatorBuilder: (context, index) {
          //       return const SizedBox(width: 10);
          //     },
          //   ),
          // ),
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
