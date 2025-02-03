import 'package:flutter/material.dart';
import '../content/content_widget.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    super.key,
    required this.id,
  });

  final int id;
  final List<Content>? contents = null;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          spacing: 12,
          children: [
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
            Content(name: 'name', label: 'label', year: 'year'),
          ],
        ),
      ),
    );
  }
}
