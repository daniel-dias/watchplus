import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';

abstract class DetailsScreenUseCase {
  Future<TitleDetails> getDetails(String id);
}
