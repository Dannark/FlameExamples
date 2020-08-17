import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameController extends Game {
  static Rect screenSize;

  final MapController _mapController = MapController();

  GameController() {}

  void render(Canvas c) {
    var bgPaint = Paint();
    bgPaint.color = Colors.green;
    c.drawRect(screenSize, bgPaint);

    _mapController.draw(c);
  }

  void update(double dt) {
    _mapController.update(dt);
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = Rect.fromLTWH(0, 0, size.width, size.height);
  }
}

class MapController {
  //map start position
  double _mapPosX = 0;
  double _mapPosY = 0;

  double cameraSpeed = 1;

  Paint _p = Paint();
  List<Rect> mapObjects = [];

  Player _player1 = Player(0, 0);
  Player _player2 = Player(150, 225);

  MapController() {
    createRandomObjects();
  }

  void draw(Canvas c) {
    // this is an example of an object that will NOT offset its position with the map
    _p.color = Color.fromRGBO(220, 220, 255, .1);
    c.drawCircle(Offset(50, 50), 10, _p);

    //save the canvas state before drawnin the map elements
    //this is where the camera logic happens

    var midScreenPointX = _mapPosX - GameController.screenSize.width / 2;
    var midScreenPointY = _mapPosY - GameController.screenSize.height / 2;

    c.save();
    c.translate(-midScreenPointX, -midScreenPointY);
    //After this line you can drawn all elements on the map that that will
    //also move according to maps position

    _p.color = Colors.green[600];
    for (var obj in mapObjects) {
      c.drawRect(obj, _p);
    }

    _player1.draw(c);

    c.restore(); //must be called at the end to stop offset items with the camera
    //After this line you can draw elements that will not move inside the map
    //For example HUD, Menus etc...
  }

  void update(double deltaTime) {
    // The target point in the map, can be a player for example
    moveMap(_player1.x, _player1.y, deltaTime);
  }

  void createRandomObjects() {
    for (var i = 0; i < 200; i++) {
      var x = (Random().nextDouble() * 1000) - 500;
      var y = (Random().nextDouble() * 2000) - 1000;

      mapObjects.add(Rect.fromLTWH(x, y, 32, 32));
    }
  }

  void moveMap(double toX, double toY, double deltaTime) {
    //lerp interpolate from a value to a value using a time
    _mapPosX = lerpDouble(_mapPosX, toX, deltaTime * cameraSpeed);
    _mapPosY = lerpDouble(_mapPosY, toY, deltaTime * cameraSpeed);
  }
}

class Player {
  double x;
  double y;
  double width = 32;
  double height = 64;

  Paint _p = Paint();

  Player(this.x, this.y) {
    _p.color = Colors.red;
    randomTeleport();
  }

  void draw(Canvas c) {
    c.drawRect(Rect.fromLTWH(x, y, width, height), _p);
  }

  Future randomTeleport() async {
    x = (Random().nextDouble() * 300) - 150;
    y = (Random().nextDouble() * 300) - 150;
    print('Teleporting player to ${x.toInt()}, ${y.toInt()}');

    await Future.delayed(Duration(seconds: 2));
    randomTeleport();
  }
}
