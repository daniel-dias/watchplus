import 'package:flutter/material.dart';
import 'package:watchplus/features/content/content_widget.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ContentList(id: 1);
    // return CustomScrollView(
    //   slivers: [
    //     const SliverAppBar(
    //       pinned: true,
    //       expandedHeight: 150,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text('Name'),
    //       ),
    //     ),
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) {
    //           return const Padding(
    //             padding:
    //                 EdgeInsets.symmetric(vertical: 8), // Add vertical spacing
    //             child: Content(name: 'name', label: 'label', year: 'year2'),
    //           );
    //         },
    //         childCount: 20,
    //       ),
    //     ),
    //   ],
    // );
  }
}
