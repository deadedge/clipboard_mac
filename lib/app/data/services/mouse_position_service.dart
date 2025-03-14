import 'package:flutter/services.dart';
import 'dart:async';

import 'package:mouse_position/mouse_position.dart';

class MousePositionService {
  static Future<Map<String, double>> getMousePosition() async {
    try {
      return MousePosition().getMousePosition();
    } on PlatformException catch (e) {
      print("Falha ao obter posição do mouse: ${e.message}");
      return {'x': 0.0, 'y': 0.0};
    }
  }
}
