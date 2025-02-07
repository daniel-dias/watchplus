import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.id,
    required this.name,
    required this.label,
    required this.year,
  });

  final String id;
  final String name;
  final String label;
  final int year;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return GestureDetector(
      onTap: () {
        context.push(
          '/detail/$id',
        );
      },
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        cursor: SystemMouseCursors.click,
        child: ValueListenableBuilder<bool>(
          valueListenable: isHovered,
          builder: (context, isHovered, child) {
            return Container(
              height: 75,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isHovered
                    ? const Color.fromARGB(255, 72, 43, 86)
                    : const Color.fromARGB(255, 47, 35, 56), // Default color
                border: Border.all(
                  color: const Color.fromARGB(255, 143, 130, 153),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 7,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        height: 22,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 191, 165, 212),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 47, 3, 92),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        year.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
