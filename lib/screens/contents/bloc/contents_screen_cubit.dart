import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/screens/contents/interface/contents_screen_repository.dart';
import 'package:watchplus/screens/contents/interface/contents_screen_usecase.dart';

enum ContentsScreenState {
  loading,
  loaded,
  error,
}

class ContentsScreenCubit extends Cubit<ContentsScreenState>
    implements ContentsScreenUseCase {
  ContentsScreenCubit(this.repository) : super(ContentsScreenState.loading);

  final ContentsScreenRepository repository;
  late TitlesResult contents;

  final int _total = 10;
  final int _page = 1;

  @override
  Future<TitlesResult> getAllContents(String id) async {
    this.contents = await repository.getRepoContents(id, _total, _page);
    //print(contents.titles.first);
    emit(ContentsScreenState.loaded);
    return this.contents;

    // CAN DO: modificate data for the screen
  }
}
