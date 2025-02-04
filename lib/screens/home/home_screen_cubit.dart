import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.swagger.dart';

enum HomeScreenState {
  loading,
  loaded,
  error,
}

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit(this.watchPlusApi) : super(HomeScreenState.loading);

  final WatchmodeApi watchPlusApi;

  void load() {
    watchPlusApi.sourcesGet().then(
      (sources) {
        print(sources.body?.first);
        emit(HomeScreenState.loaded);
      },
    );
    // Future.delayed(const Duration(seconds: 2)).then(
    //   (_) {
    //     emit(HomeScreenState.loaded);
    //   },
    // );
  }

  void printHello() {
    print('Hello');
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        emit(HomeScreenState.error);
      },
    );
  }
}
