import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mouse_position_method_channel.dart';

abstract class MousePositionPlatform extends PlatformInterface {
  /// Constructs a MousePositionPlatform.
  MousePositionPlatform() : super(token: _token);

  static final Object _token = Object();

  static MousePositionPlatform _instance = MethodChannelMousePosition();

  /// The default instance of [MousePositionPlatform] to use.
  ///
  /// Defaults to [MethodChannelMousePosition].
  static MousePositionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MousePositionPlatform] when
  /// they register themselves.
  static set instance(MousePositionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, double>> getMousePosition() {
    throw UnimplementedError('getMousePosition() has not been implemented.');
  }
}
