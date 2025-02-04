import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:watchplus/api/watchmode_api.dart';
import 'package:watchplus/app_config.dart';
import 'package:watchplus/screens/home/home_screen.dart';
import 'package:watchplus/screens/home/home_screen_cubit.dart';
import 'package:watchplus/screens/contents/contents_screen.dart';
import 'package:watchplus/screens/contents/contents_screen_cubit.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
        create: (_) => HomeScreenCubit()..load(),
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/contentlist/:id',
      // builder: (context, state) {
      //   final id = state.pathParameters['id'];
      //   return ContentList(id: id!);
      // },
      builder: (context, state) => BlocProvider(
        create: (_) => ContentsScreenCubit()..load(),
        child: ContentsScreen(id: state.pathParameters['id']!),
      ),
    ),
  ],
);

class DataHandler {
  final ddd = createWatchmodeApi(
    baseUrl: config.watchmodeBaseUrl,
    apiKey: config.watchmodeApiKey,
  );
}
