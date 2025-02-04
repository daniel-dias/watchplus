import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/features/content_list/content_list_widget.dart';
import 'package:watchplus/screens/contents/contents_screen_cubit.dart';

class ContentsScreen extends StatelessWidget {
  ContentsScreen({
    super.key,
    required this.id,
  });

  final String id;
  late ContentsScreenCubit contentsScreenCubit;

  @override
  Widget build(BuildContext context) {
    contentsScreenCubit = context.read<ContentsScreenCubit>();
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
              return buildPage();
            case ContentsScreenState.error:
              return buildError();
          }
        },
      ),
    );
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

  Widget buildPage() {
    return ContentList(id: id);
  }

  Widget buildError() {
    return const Center(
      child: Text('Error'),
    );
  }
}
