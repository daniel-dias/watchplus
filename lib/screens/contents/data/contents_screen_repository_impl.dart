import 'package:watchplus/api/gen/watchmode_api.swagger.dart';
import 'package:watchplus/screens/contents/domain/contents_screen_repository.dart';

class ContentsScreenRepositoryImpl implements ContentsScreenRepository {
  ContentsScreenRepositoryImpl({required this.watchPlusApi});

  final WatchmodeApi watchPlusApi;

  @override
  Future<TitlesResult> getRepoContents(
    String sourceIds,
    int limit,
    int page,
  ) async {
    final response = await watchPlusApi.listTitlesGet(
      sourceIds: sourceIds,
      limit: limit,
      page: page,
    );
    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw Exception('Failed to load contents');
    }
  }
}
