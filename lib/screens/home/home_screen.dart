import 'package:flutter/material.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';
import 'package:watchplus/features/source/source_widget.dart';
import 'package:watchplus/features/source_list/source_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color.fromARGB(255, 60, 28, 90),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: const Column(
            children: [
              Text(
                'WatchPlus',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              Text(
                'Sources',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SourceList(
          title: 'Subscription Service',
          sources: [
            Source(text: '1', sourceUrl: 'assets/placeholder.png'),
            Source(text: '2', sourceUrl: 'assets/placeholder.png'),
            Source(text: '3', sourceUrl: 'assets/placeholder.png'),
            Source(text: '4', sourceUrl: 'assets/placeholder.png'),
            Source(text: '5', sourceUrl: 'assets/placeholder.png'),
            Source(text: '6', sourceUrl: 'assets/placeholder.png'),
          ],
        ),
        const SourceList(
          title: 'Free',
          sources: [
            Source(text: '7', sourceUrl: 'assets/placeholder.png'),
            Source(text: '8', sourceUrl: 'assets/placeholder.png'),
          ],
        ),
      ],
    );
  }
}
