import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/screens/details/bloc/details_screen_cubit.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    super.key,
  });

  late DetailsScreenCubit detailsScreenCubit;

  @override
  Widget build(BuildContext context) {
    print('DetailsScreen build');
    detailsScreenCubit = context.read<DetailsScreenCubit>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<DetailsScreenCubit, DetailsScreenState>(
        builder: (context, state) {
          if (state == DetailsScreenState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == DetailsScreenState.loaded) {
            return buildPage();
          } else {
            return buildError();
          }
        },
      ),
    );
  }

  Widget buildPage() {
    print(detailsScreenCubit.details);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPageHeader(),
        buildPageContent(),
      ],
    );
  }

  Widget buildPageHeader() {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(detailsScreenCubit.details.poster),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(detailsScreenCubit.details.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPageContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14,
        children: [
          Text(
            textAlign: TextAlign.left,
            detailsScreenCubit.details.title,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            spacing: 10,
            children: [
              Container(
                height: 22,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 191, 165, 212),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  detailsScreenCubit.details.type.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 47, 3, 92),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                detailsScreenCubit.details.year.toString(),
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: detailsScreenCubit.details.genreNames.map((genre) {
              return Container(
                height: 22,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  genre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          Text(
            detailsScreenCubit.details.plotOverview,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Critic Score: ${detailsScreenCubit.details.criticScore}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Text(
                'User Rating: ${detailsScreenCubit.details.userRating}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Text(
                'Relevance: ${detailsScreenCubit.details.relevancePercentile}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildError() {
    return const Center(
      child: Text('Error'),
    );
  }
}
