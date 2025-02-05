import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';
import 'package:watchplus/screens/contents/bloc/contents_screen_cubit.dart';

class ContentsScreen extends StatelessWidget {
  ContentsScreen({
    super.key,
    //required this.id,
  });

  // final String id;
  late ContentsScreenCubit contentsScreenCubit;
  late String text;
  late String sourceUrl;

  @override
  Widget build(BuildContext context) {
    contentsScreenCubit = context.read<ContentsScreenCubit>();

    final GoRouterState state = GoRouter.of(context).state;
    final extra = state.extra! as Map<String, String>;
    print(extra);
    this.text = extra['text'] as String;
    this.sourceUrl = extra['sourceUrl'] as String;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ContentsScreenCubit, ContentsScreenState>(
        bloc: contentsScreenCubit,
        builder: (context, state) {
          switch (state) {
            case ContentsScreenState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ContentsScreenState.loaded:
              return buildPage(contentsScreenCubit);
            case ContentsScreenState.error:
              return buildError();
          }
        },
      ),
    );
  }

  Widget buildPage(ContentsScreenCubit contentsScreenCubit) {
    return ContentList(contentsScreenCubit.contents, this.text, this.sourceUrl);
  }

  Widget buildError() {
    return const Center(
      child: Text('Error'),
    );
  }
}
