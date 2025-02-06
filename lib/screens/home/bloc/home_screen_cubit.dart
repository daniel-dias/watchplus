import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.swagger.dart';
import 'package:watchplus/screens/home/interface/home_screen_repository.dart';
import 'package:watchplus/screens/home/interface/home_screen_usecase.dart';

enum HomeScreenState {
  loading,
  loaded,
  error,
}

class HomeScreenCubit extends Cubit<HomeScreenState>
    implements HomeScreenUseCase {
  HomeScreenCubit(this.repository) : super(HomeScreenState.loading);

  final HomeScreenRepository repository;
  late Map<String, List<SourceSummary>> sourcesByType;

  @override
  Future<Map<String, List<SourceSummary>>> getAllRails() async {
    final sources = await repository.getRepoRails();
    this.sourcesByType = groupBy(sources, (source) => source.type.name);

    //print(sourcesByType.keys);
    emit(HomeScreenState.loaded);
    return sourcesByType;

    // CAN DO: modificate data for the screen
  }
}
