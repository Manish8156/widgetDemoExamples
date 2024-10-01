import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_demo_examples/flutter_flame/dino_game.dart';
import 'flutter_flame/game_screen.dart';

mainAppRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  // await AppLinkServices.init();
  // await Hive.initFlutter();
  // await Injector.setUp();
  // await sl<HiveAppRepository>().registerAdapters();
  // await sl<HiveAppRepository>().openBoxes();
  final game = DinoGame();
  runApp(MyApp(
    game: game,
  ));
}

class MyApp extends StatefulWidget {
  final DinoGame game;
  const MyApp({super.key, required this.game});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final GoRouter route = GoRouter(routes: [
  //   GoRoute(
  //     path: "/",
  //     builder: (context, state) => GameScreen(
  //       game: this.game,
  //     ),
  //   )
  // ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // navigatorKey: ContextUtility.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => GameScreen(
            game: widget.game,
          ),
        )
      ]),
      // home: GoogleMapChangeTheming(),
      // routes: {'/': (_) => const HivePage(), '/green': (_) => const GreenPage(), '/red': (_) => const RedPage()},
    );
  }
}

class InitialRoutes extends StatelessWidget {
  const InitialRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
