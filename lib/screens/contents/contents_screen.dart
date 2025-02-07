import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';
import 'package:watchplus/screens/contents/bloc/contents_screen_cubit.dart';

class ContentsScreen extends StatelessWidget {
  ContentsScreen({
    super.key,
  });

  // final String id;
  //late ContentsScreenCubit contentsScreenCubit;
  late String text;
  late String sourceUrl;

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouter.of(context).state;
    final extra = state.extra as Map<String, String>?;
    print(extra);
    this.text = extra?['text'] ?? '';
    this.sourceUrl = extra?['sourceUrl'] ?? '';

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ContentsScreenCubit, ContentsScreenState>(
        builder: (context, state) {
          switch (state) {
            case ContentsScreenState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ContentsScreenState.loaded:
            case ContentsScreenState.partialloading:
              return buildPage(context);
            case ContentsScreenState.error:
              return buildError();
          }
        },
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    final contentsScreenCubit = context.watch<ContentsScreenCubit>();
    return ContentList(contentsScreenCubit.contents, this.text, this.sourceUrl);
  }

  Widget buildError() {
    return const Center(
      child: Text('Error'),
    );
  }
}
