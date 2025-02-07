import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/screens/contents/interface/contents_screen_repository.dart';
import 'package:watchplus/screens/contents/interface/contents_screen_usecase.dart';

enum ContentsScreenState {
  loading,
  partialloading,
  loaded,
  error,
}

class ContentsScreenCubit extends Cubit<ContentsScreenState>
    implements ContentsScreenUseCase {
  ContentsScreenCubit(this.repository) : super(ContentsScreenState.loading);

  final ContentsScreenRepository repository;
  //late TitlesResult titlesResult;

  late List<TitleSummary> contents;

  final int _resultsNumber = 10;
  int _totalPages = 0;
  int _page = 1;

  @override
  Future<List<TitleSummary>> getAllContents(String id) async {
    final TitlesResult titlesResult =
        await repository.getRepoContents(id, _resultsNumber, _page);
    _totalPages = titlesResult.totalPages;
    contents = titlesResult.titles;

    emit(ContentsScreenState.loaded);
    return contents;
  }

  @override
  Future<List<TitleSummary>> getMoreContents(String id) async {
    if (++_page < _totalPages) {
      emit(ContentsScreenState.partialloading);
      final TitlesResult titlesResult =
          await repository.getRepoContents(id, _resultsNumber, _page);
      contents.addAll(titlesResult.titles);
      emit(ContentsScreenState.loaded);

      return contents;
    }
    return contents;
  }
}
