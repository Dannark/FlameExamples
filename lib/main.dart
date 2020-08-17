import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'examples/smooth_camera_follow/smooth_camera_follow.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var gameController = GameController();
  runApp(gameController.widget);

  var flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
}
