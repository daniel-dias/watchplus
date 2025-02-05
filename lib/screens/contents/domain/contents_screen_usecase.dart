import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class ContentsScreenUseCase {
  Future<TitlesResult> getAllContents(String sourceIds, int limit, int page);

  //Future<SourceSummary> getSourceProvider(String sourceId);
}
