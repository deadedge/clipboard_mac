import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mouse_position_platform_interface.dart';

/// An implementation of [MousePositionPlatform] that uses method channels.
class MethodChannelMousePosition extends MousePositionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mouse_position');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<Map<String, double>> getMousePosition() async {
    final result = await methodChannel.invokeMapMethod<String, dynamic>(
      'getMousePosition',
    );
    if (result != null) {
      return {'x': result['x'] as double, 'y': result['y'] as double};
    }
    throw PlatformException(
      code: 'error',
      message: 'Não foi possível obter a posição do mouse',
    );
  }
}
