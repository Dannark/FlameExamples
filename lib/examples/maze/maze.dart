import 'package:FlameExamples/examples/maze/recursive_maze.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class Maze extends Game {
  List walls;
  Paint p = Paint();

  Maze() {
    walls = RecursiveMaze()
        .build(41, 41, orientationType: OrientationType.randomized);
  }

  @override
  void render(Canvas c) {
    var bgPaint = Paint();
    bgPaint.color = Colors.black;

    p.color = Color.fromRGBO(255, 255, 255, .5);
    for (var wall in walls) {
      c.drawRect(
          Rect.fromLTWH(
            16 + double.parse(wall['x'].toString()) * 8,
            16 + double.parse(wall['y'].toString()) * 8,
            8,
            8,
          ),
          p);
    }
  }

  @override
  void update(double t) {}
}
