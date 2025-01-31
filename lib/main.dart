import 'package:flutter/material.dart';
import 'package:watchplus/app_config.dart';
import 'package:watchplus/features/source/source_widget.dart';
import 'package:watchplus/features/source_list/source_list_widget.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 7, 20),
        body: SizedBox(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 60, 28, 90),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
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
                  Source(text: '9', sourceUrl: 'assets/placeholder.png'),
                  Source(text: '10', sourceUrl: 'assets/placeholder.png'),
                  Source(text: '11', sourceUrl: 'assets/placeholder.png'),
                  Source(text: '12', sourceUrl: 'assets/placeholder.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
