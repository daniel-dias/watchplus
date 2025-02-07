import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class ContentsScreenUseCase {
  Future<List<TitleSummary>> getAllContents(String sourceIds);

  Future<List<TitleSummary>> getMoreContents(String sourceIds);
}
