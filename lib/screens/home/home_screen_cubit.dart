import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeScreenState {
  loading,
  loaded,
  error,
}

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.loading);

  void load() {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        emit(HomeScreenState.loaded);
      },
    );
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
