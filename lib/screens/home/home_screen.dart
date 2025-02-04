import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/features/source/source_widget.dart';
import 'package:watchplus/features/source_list/source_list_widget.dart';
import 'package:watchplus/screens/home/home_screen_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  late HomeScreenCubit homeScreenCubit;

  @override
  Widget build(BuildContext context) {
    homeScreenCubit = context.read<HomeScreenCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        bloc: homeScreenCubit,
        builder: (context, state) {
          switch (state) {
            case HomeScreenState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeScreenState.loaded:
              return buildPage();
            case HomeScreenState.error:
              return buildError();
          }
        },
      ),
    );
  }

  Widget buildPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color.fromARGB(255, 60, 28, 90),
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          child: const Column(
            children: [
              Text(
                'WatchPlus',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              Text(
                'Sources',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SourceList(
          title: 'Subscription Service',
          sources: [
            Source(
              id: '1',
              text: 'text1',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '2',
              text: 'text2',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '3',
              text: 'text3',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '4',
              text: 'text4',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '5',
              text: 'text5',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '6',
              text: 'text6',
              sourceUrl: 'assets/placeholder.png',
            ),
          ],
        ),
        const SourceList(
          title: 'Free',
          sources: [
            Source(
              id: '7',
              text: 'text7',
              sourceUrl: 'assets/placeholder.png',
            ),
            Source(
              id: '8',
              text: 'text8',
              sourceUrl: 'assets/placeholder.png',
            ),
          ],
        ),
      ],
    );
  }

  Widget buildError() {
    return const Placeholder();
  }
}
