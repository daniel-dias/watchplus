import 'package:flutter/material.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import '../content/content_widget.dart';

class ContentList extends StatelessWidget {
  const ContentList(
    this.contents,
    this.text,
    this.sourceUrl, {
    super.key,
  });

  final TitlesResult contents;
  final String text;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    print(contents.titles[1]);
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
              this.text,
              style: const TextStyle(color: Colors.white),
            ),
            background: Image.network(
              this.sourceUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Content(
                  name: contents.titles[index].title,
                  label: contents.titles[index].type.value.toString(),
                  year: contents.titles[index].year.toString(),
                ),
              );
            },
            childCount: contents.titles.length,
          ),
        ),
      ],
    );
  }
}
