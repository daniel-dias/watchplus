import 'package:flutter/material.dart';
import '../content/content_widget.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    super.key,
    required this.id,
  });

  final String id;
  final List<Content>? contents = null;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          pinned: true,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              id,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8), // Add vertical spacing
                child: Content(name: 'name', label: 'label', year: 'year2'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );

    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 4),
    //   child: ListView.separated(
    //     itemCount: 20,
    //     itemBuilder: (context, index) {
    //       return const Content(name: 'name', label: 'label', year: 'year2');
    //     },
    //     separatorBuilder: (context, index) {
    //       return const SizedBox(height: 12);
    //     },
    //   ),
    // );
  }
}
