import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.swagger.dart';
import 'package:watchplus/screens/home/domain/home_screen_repository.dart';
// import 'package:watchplus/screens/home/bloc/home_screen_usecase_impl.dart';
import 'package:watchplus/screens/home/domain/home_screen_usecase.dart';
import 'package:watchplus/screens/home/home_screen.dart';

enum HomeScreenState {
  loading,
  loaded,
  error,
}

class HomeScreenCubit extends Cubit<HomeScreenState>
    implements HomeScreenUseCase {
  // HomeScreenCubit(this.watchPlusApi) : super(HomeScreenState.loading);

  // final WatchmodeApi watchPlusApi;

  HomeScreenCubit(this.repository) : super(HomeScreenState.loading);

  final HomeScreenRepository repository;
  //final GetSourcesUseCase getSourcesUseCase;

  // void load() {
  //   watchPlusApi.sourcesGet().then(
  //     (sources) {
  //       print(sources.body?.first);
  //       emit(HomeScreenState.loaded);
  //     },
  //   );
  // }

  // Future<void> load() async {
  //   final response = await watchPlusApi.sourcesGet();
  //   if (response.isSuccessful) {
  //     print(response.body?.first);
  //     emit(HomeScreenState.loaded);
  //   } else {
  //     emit(HomeScreenState.error);
  //   }
  // }

  @override
  Future<List<SourceSummary>> load() async {
    final sources = await repository.getSources();
    print(sources.first);
    emit(HomeScreenState.loaded);
    return repository.getSources();

    // CAN DO: modificate data for the screen
  }
}
