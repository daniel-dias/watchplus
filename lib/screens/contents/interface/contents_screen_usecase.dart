import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class ContentsScreenUseCase {
  Future<TitlesResult> getAllContents(String sourceIds);

  //Future<SourceSummary> getSourceProvider(String sourceId);
}
