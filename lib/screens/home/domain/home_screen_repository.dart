import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class HomeScreenRepository {
  Future<List<SourceSummary>> getSources();
}
