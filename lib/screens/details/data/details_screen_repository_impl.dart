import 'package:watchplus/api/gen/client_index.dart';
import 'package:watchplus/api/gen/watchmode_api.models.swagger.dart';
import 'package:watchplus/screens/details/interface/details_screen_repository.dart';

class DetailsScreenRepositoryImpl implements DetailsScreenRepository {
  DetailsScreenRepositoryImpl({required this.watchPlusApi});

  final WatchmodeApi watchPlusApi;

  @override
  Future<TitleDetails> getRepoDetails(
    String id,
  ) async {
    final response = await watchPlusApi.titleTitleIdDetailsGet(
      titleId: int.parse(id),
    );
    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw Exception('Failed to load details');
    }
  }
}
