import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class ContentsScreenRepository {
  Future<TitlesResult> getRepoContents(String sourceIds, int limit, int page);
}
