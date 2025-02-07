import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/screens/contents/bloc/contents_screen_cubit.dart';
import '../content/content_widget.dart';

class ContentList extends StatefulWidget {
  const ContentList(
    this.contents,
    this.text,
    this.sourceUrl, {
    super.key,
  });

  final List<TitleSummary> contents;
  final String text;
  final String sourceUrl;

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    //print(this.widget.contents.titles[1]);
    // context
    //     .read<ContentsScreenCubit>().getRemainingContents(this.widget.contents);
    return CustomScrollView(
      controller: _scrollController,
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
              this.widget.text,
              style: const TextStyle(color: Colors.white),
            ),
            background: isValidUrl(this.widget.sourceUrl)
                ? Image.network(
                    this.widget.sourceUrl,
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
                  id: this.widget.contents[index].id.toString(),
                  name: this.widget.contents[index].title,
                  label: this.widget.contents[index].type.name,
                  year: this.widget.contents[index].year,
                ),
              );
            },
            childCount: this.widget.contents.length,
          ),
        ),
      ],
    );
  }

  bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }

  void _onScroll() {
    // if (_scrollController.position.pixels ==
    //         _scrollController.position.maxScrollExtent &&
    //     !_isLoading) {
    //   _loadMoreItems();
    // }

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final id = GoRouterState.of(context).pathParameters['id'];
      // Provider.of<ContentsScreenCubit>(context, listen: false)
      //     .getMoreContents(id!);
      context.read<ContentsScreenCubit>().getMoreContents(id!);
      print("print more items");
    }
  }
}
