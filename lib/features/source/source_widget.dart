import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Source extends StatelessWidget {
  const Source({
    super.key,
    required this.id,
    required this.text,
    required this.sourceUrl,
  });

  final String id;
  final String text;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/contentlist/$id',
          extra: {'text': text, 'sourceUrl': sourceUrl},
        );
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Image.network(
              sourceUrl,
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
