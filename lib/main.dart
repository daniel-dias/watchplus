import 'package:flutter/material.dart';
import 'package:watchplus/app_config.dart';
import 'package:watchplus/features/source/source_widget.dart';

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
              Container(
                color: const Color.fromARGB(255, 13, 4, 22),
                child: const Source(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
