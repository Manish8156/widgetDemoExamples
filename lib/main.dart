import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_demo_examples/flutter_flame/dino_game.dart';
import 'flutter_flame/game_screen.dart';

Future<void> mainAppRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AppLinkServices.init();
  // await Hive.initFlutter();
  // await Injector.setUp();
  // await sl<HiveAppRepository>().registerAdapters();
  // await sl<HiveAppRepository>().openBoxes();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    return const MaterialApp(
      home: InitialRoutes(),
    );
  }
}

class InitialRoutes extends StatelessWidget {
  const InitialRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
