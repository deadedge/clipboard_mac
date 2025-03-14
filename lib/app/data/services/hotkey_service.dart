import 'package:clipboard_mac/app/data/services/mouse_position_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class HotkeyService {
  late final WindowService _windowService;
  HotkeyService({required windowsService}) : _windowService = windowsService;

  init() async {
    await hotKeyManager.register(
      HotKey(
        key: PhysicalKeyboardKey.keyV,
        modifiers: [HotKeyModifier.control],
        scope: HotKeyScope.system,
      ),
      keyDownHandler: (hotKey) async {
        bool isVisible = await _windowService.window.isVisible();

        if (isVisible) {
          await _windowService.window.hide();
        } else {
          // Position the window at the mouse cursor
         // await MousePositionService.positionWindowAtMouseCursor();
          
          // Then show and focus the window
          await _windowService.window.show();
          await _windowService.window.focus();
        }
      },
    );
  }
}
