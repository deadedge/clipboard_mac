import 'package:flutter_test/flutter_test.dart';
import 'package:mouse_position/mouse_position.dart';
import 'package:mouse_position/mouse_position_platform_interface.dart';
import 'package:mouse_position/mouse_position_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMousePositionPlatform
    with MockPlatformInterfaceMixin
    implements MousePositionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<Map<String, double>> getMousePosition() {
    // TODO: implement getMousePosition
    throw UnimplementedError();
  }
}

void main() {
  final MousePositionPlatform initialPlatform = MousePositionPlatform.instance;

  test('$MethodChannelMousePosition is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMousePosition>());
  });

  test('getPlatformVersion', () async {
    MousePosition mousePositionPlugin = MousePosition();
    MockMousePositionPlatform fakePlatform = MockMousePositionPlatform();
    MousePositionPlatform.instance = fakePlatform;

    expect(await mousePositionPlugin.getPlatformVersion(), '42');
  });
}
