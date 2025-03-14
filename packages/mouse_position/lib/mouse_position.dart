import 'mouse_position_platform_interface.dart';

class MousePosition {
  Future<String?> getPlatformVersion() {
    return MousePositionPlatform.instance.getPlatformVersion();
  }

  Future<Map<String, double>> getMousePosition() {
    return MousePositionPlatform.instance.getMousePosition();
  }
}
