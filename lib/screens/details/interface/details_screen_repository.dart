import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class DetailsScreenRepository {
  Future<TitleDetails> getRepoDetails(String id);
}
