import 'package:flutter_bloc/flutter_bloc.dart';

enum ContentsScreenState {
  loading,
  loaded,
  error,
}

class ContentsScreenCubit extends Cubit<ContentsScreenState> {
  ContentsScreenCubit() : super(ContentsScreenState.loading);

  void load() {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) {
        emit(ContentsScreenState.loaded);
      },
    );
  }
}
