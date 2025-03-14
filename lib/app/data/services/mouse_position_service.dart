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

  /*   _windowService.window
  static Future<bool> positionWindowAtMouseCursor() async {
    try {
      // Verificar se o método está disponível
      await waitForMethodAvailability();
      
      // Obter posição do mouse
      final position = await getMousePosition();
      
      // Posicionar a janela
      await windowPlatform.invokeMethod('positionWindow', {
        'x': position['x'],
        'y': position['y'],
      });
      return true;
    } on PlatformException catch (e) {
      print("Falha ao posicionar janela: ${e.message}");
      return false;
    }
  } */
}
