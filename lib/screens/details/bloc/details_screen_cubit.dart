import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/screens/details/interface/details_screen_repository.dart';
import 'package:watchplus/screens/details/interface/details_screen_usecase.dart';

enum DetailsScreenState {
  loading,
  loaded,
  error,
}

class DetailsScreenCubit extends Cubit<DetailsScreenState>
    implements DetailsScreenUseCase {
  DetailsScreenCubit(this.repository) : super(DetailsScreenState.loading);

  final DetailsScreenRepository repository;
  late TitleDetails details;

  @override
  Future<TitleDetails> getDetails(String id) async {
    this.details = await repository.getRepoDetails(id);
    emit(DetailsScreenState.loaded);
    return this.details;
  }
}
