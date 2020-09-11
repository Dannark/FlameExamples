import 'package:FlameExamples/examples/maze/maze.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var gameController = SmoothCameraController();
  var gameController = Maze();
  runApp(gameController.widget);

  var flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
}
