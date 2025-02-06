import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/features/source/source_widget.dart';
import 'package:watchplus/features/source_list/source_list_widget.dart';
import 'package:watchplus/screens/home/bloc/home_screen_cubit.dart';

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
              return buildPage(homeScreenCubit);
            case HomeScreenState.error:
              return buildError();
          }
        },
      ),
    );
  }

  Widget buildPage(HomeScreenCubit homeScreenCubit) {
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
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(14),
            children: homeScreenCubit.sourcesByType.entries
                .map((entry) => buildSourceList(entry.key, entry.value))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildSourceList(String sourceType, List<SourceSummary> sources) {
    print(sourceType);
    return SourceList(
      title: sourceType,
      sources: sources.map((element) {
        return Source(
          id: element.id.toString(),
          text: element.name,
          sourceUrl: element.logo100px,
        );
      }).toList(),
    );
  }

  Widget buildError() {
    return const Center(
      child: Text('Error Building Home Screen'),
    );
  }
}
