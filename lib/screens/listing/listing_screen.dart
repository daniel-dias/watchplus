import 'package:flutter/material.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.all(10),
          child: const Row(
            children: [
              Text(
                '<-',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              Text(
                'Name',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ],
          ),
        ),
        const ContentList(id: 1)
      ],
    );
  }
}
