import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'package:pixel_adventure/levels/level.dart';
import 'package:pixel_adventure/actors/player.dart';

class PixelAdventure extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;
  Player player = Player(character: 'Mask Dude');

  @override
  FutureOr<void> onLoad() async {
    // Load all images into cache
    await images.loadAllImages();

    final world = Level(
      levelName: 'level-01',
      player: player,
    );

    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 360,
    );
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);

    return super.onLoad();
  }
}
