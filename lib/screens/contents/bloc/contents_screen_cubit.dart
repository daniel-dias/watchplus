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

  @override
  Future<TitlesResult> getAllContents(String id, int total, int page) async {
    this.contents = await repository.getRepoContents(id, total, page);
    print(contents.titles.first);
    emit(ContentsScreenState.loaded);
    return this.contents;

    // CAN DO: modificate data for the screen
  }
}
