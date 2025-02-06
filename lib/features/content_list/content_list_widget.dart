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
            background: isValidUrl(this.sourceUrl)
                ? Image.network(
                    this.sourceUrl,
                    fit: BoxFit.fitHeight,
                  )
                : null,
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
                  id: contents.titles[index].id.toString(),
                  name: contents.titles[index].title,
                  label: contents.titles[index].type.name,
                  year: contents.titles[index].year,
                ),
              );
            },
            childCount: contents.titles.length,
          ),
        ),
      ],
    );
  }

  bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }
}
