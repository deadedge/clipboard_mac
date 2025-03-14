import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:localization/localization.dart';
import 'package:system_tray/system_tray.dart';

class SystemTrayService {
  final SystemTray _systemTray = SystemTray();
  late final WindowService _windowService;
  SystemTrayService({required WindowService windowService})
    : _windowService = windowService;

  final Menu _menuMain = Menu();

  SystemTray get systemTray => _systemTray;
  Menu get menu => _menuMain;

  Future<void> initialize() async {
    await _systemTray.initSystemTray(iconPath: "assets/images/icon.png");
    await _systemTray.setToolTip(
      "Now you can get your clipboard history easy and fast",
    );

    await _menuMain.buildFrom([
      MenuItemLabel(
        label: "tray.open".i18n(),
        onClicked: (menuItem) => _windowService.window.show(),
      ),
      MenuSeparator(),
      MenuItemLabel(
        label: "tray.exit".i18n(),
        onClicked: (menuItem) => _windowService.window.destroy(),
      ),
    ]);
    await _systemTray.setContextMenu(_menuMain);

    _systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        _systemTray.popUpContextMenu();
      }
    });
  }
}
