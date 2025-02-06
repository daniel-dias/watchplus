import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class HomeScreenUseCase {
  Future<Map<String, List<SourceSummary>>> getAllRails();
}
