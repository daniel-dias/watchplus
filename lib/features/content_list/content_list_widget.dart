import 'package:flutter/material.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import '../content/content_widget.dart';

class ContentList extends StatelessWidget {
  ContentList(
    this.contents,
    this.text,
    this.sourceUrl, {
    super.key,
  });

  //final ScrollController _scrollController = ScrollController();

  final TitlesResult contents;
  final String text;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    print(this.contents.titles[1]);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          // title: Text(
          //   this.text,
          //   style: const TextStyle(color: Colors.white),
          // ),
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
                  id: this.contents.titles[index].id.toString(),
                  name: this.contents.titles[index].title,
                  label: this.contents.titles[index].type.name,
                  year: this.contents.titles[index].year,
                ),
              );
            },
            childCount: this.contents.titles.length,
          ),
        ),
      ],
    );
  }

  bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }

  // void _onScroll() {
  //   // if (_scrollController.position.pixels ==
  //   //         _scrollController.position.maxScrollExtent &&
  //   //     !_isLoading) {
  //   //   _loadMoreItems();
  //   // }

  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     print("print more items");
  //   }
  // }
}
