import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:widgets_demo_examples/flutter_flame/dino_game.dart';

import 'helper/naviagtor_key.dart';

class GameScreen extends StatefulWidget {
  final DinoGame game;
  const GameScreen({super.key, required this.game});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: widget.game,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: NavigationKeys(
              onDirectionChanged: widget.game.onArrowKeyChanged,
            ),
          ),
        ],
      ),
    );
  }
}
