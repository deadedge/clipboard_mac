import 'package:flutter/services.dart';
import 'dart:async';

class MousePositionService {
  static const platform = MethodChannel('app.channel/mouse_position');
  static const windowPlatform = MethodChannel('app.channel/window_position');
  
  // Indica se o método está realmente disponível
  static bool _isMethodAvailable = false;
  
  // Verificar se o método está disponível
  static Future<bool> checkMethodAvailability() async {
    if (_isMethodAvailable) return true;
    
    try {
      await platform.invokeMethod('getMousePosition');
      _isMethodAvailable = true;
      return true;
    } catch (e) {
      // Se for um PlatformException com código diferente de MissingPluginException,
      // significa que o método existe mas falhou por outro motivo
      if (e is PlatformException && e.code != 'MissingPluginException') {
        _isMethodAvailable = true;
        return true;
      }
      print("Método não disponível: ${e.toString()}");
      return false;
    }
  }
  
  // Tentar várias vezes até o método ficar disponível
  static Future<bool> waitForMethodAvailability({int maxAttempts = 10, int delayMs = 500}) async {
    for (int i = 0; i < maxAttempts; i++) {
      print("Tentativa ${i+1} de verificar disponibilidade do método");
      if (await checkMethodAvailability()) {
        return true;
      }
      await Future.delayed(Duration(milliseconds: delayMs));
    }
    return false;
  }
  
  static Future<Map<String, double>> getMousePosition() async {
    try {
      // Verificar se o método está disponível
      await waitForMethodAvailability();
      
      final Map result = await platform.invokeMethod('getMousePosition');
      return {
        'x': result['x'] as double,
        'y': result['y'] as double,
      };
    } on PlatformException catch (e) {
      print("Falha ao obter posição do mouse: ${e.message}");
      return {'x': 0.0, 'y': 0.0};
    }
  }
  
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
  }
}