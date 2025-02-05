import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watchplus/api/gen/client_index.dart';
import 'package:watchplus/api/watchmode_api.dart';
import 'package:watchplus/app_config.dart';
import 'package:watchplus/screens/contents/bloc/contents_screen_cubit.dart';
import 'package:watchplus/screens/contents/contents_screen.dart';
import 'package:watchplus/screens/contents/data/contents_screen_repository_impl.dart';
import 'package:watchplus/screens/home/bloc/home_screen_cubit.dart';
import 'package:watchplus/screens/home/data/home_screen_repository_impl.dart';
import 'package:watchplus/screens/home/domain/home_screen_repository.dart';
import 'package:watchplus/screens/home/home_screen.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

final WatchmodeApi watchPlusApi = createWatchmodeApi(
  baseUrl: config.watchmodeBaseUrl,
  apiKey: config.watchmodeApiKey,
);

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => HomeScreenCubit(
          HomeScreenRepositoryImpl(watchPlusApi: watchPlusApi),
        )..getAllRails(),
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/contentlist/:id',
      builder: (context, state) => BlocProvider(
        create: (_) => ContentsScreenCubit(
          ContentsScreenRepositoryImpl(watchPlusApi: watchPlusApi),
        )..getAllContents(state.pathParameters['id']!, 20, 1),
        child: ContentsScreen(),
      ),
    ),
  ],
);

// class DataHandler {
//   WatchmodeApi watchPlusApi = createWatchmodeApi(
//     baseUrl: config.watchmodeBaseUrl,
//     apiKey: config.watchmodeApiKey,
//   );
// }
