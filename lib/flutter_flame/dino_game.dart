import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:widgets_demo_examples/flutter_flame/dino_player.dart';
import 'package:widgets_demo_examples/flutter_flame/dino_world.dart';

import 'helper/enum.dart';

class DinoGame extends FlameGame with KeyboardEvents {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoWorld _dinoWorld = DinoWorld();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_dinoWorld);
    await add(_dinoPlayer);
    _dinoPlayer.position = _dinoWorld.size / 1.5;
    camera.follow(_dinoPlayer);
    camera.setBounds(
      Rectangle.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y),
    );
  }

  onArrowKeyChanged(Direction direction) {
    _dinoPlayer.direction = direction;
  }
}
