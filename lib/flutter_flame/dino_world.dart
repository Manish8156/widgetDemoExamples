import 'dart:async';

import 'package:flame/components.dart';

class DinoWorld extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite("background.png");
    size = sprite!.originalSize;
  }
}
