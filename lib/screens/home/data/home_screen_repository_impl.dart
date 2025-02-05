import 'package:watchplus/api/gen/watchmode_api.swagger.dart';
import 'package:watchplus/screens/home/domain/home_screen_repository.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  HomeScreenRepositoryImpl({required this.watchPlusApi});

  final WatchmodeApi watchPlusApi;

  @override
  Future<List<SourceSummary>> getRepoRails() async {
    final response = await watchPlusApi.sourcesGet();
    if (response.isSuccessful) {
      return response.body ?? [];
    } else {
      throw Exception('Failed to load sources');
    }
  }
}
