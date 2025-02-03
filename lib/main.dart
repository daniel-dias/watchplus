import 'package:flutter/material.dart';
import 'package:watchplus/app_config.dart';
import 'package:watchplus/screens/home/home_screen.dart';
import 'package:watchplus/screens/listing/listing_screen.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 14, 7, 20),
        body: SizedBox(
          child: ListingScreen(),
        ),
      ),
    );
  }
}
