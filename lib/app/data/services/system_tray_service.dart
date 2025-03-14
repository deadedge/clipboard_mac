import 'package:clipboard_mac/app/data/services/local_storage_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:localization/localization.dart';
import 'package:system_tray/system_tray.dart';

const String configKey = "configs";

class SystemTrayService {
  final SystemTray _systemTray = SystemTray();
  late final WindowService _windowService;
  late final LocalStorageService _localStorageService;
  bool _saveContent = true;

  SystemTrayService({
    required WindowService windowService,
    required LocalStorageService localStorage,
  }) : _windowService = windowService,
       _localStorageService = localStorage;

  final Menu _menuMain = Menu();

  SystemTray get systemTray => _systemTray;
  Menu get menu => _menuMain;

  Future<void> initialize() async {
    final bool? configSaved = await _localStorageService.getBool(configKey);
    if (configSaved == null) {
      await _localStorageService.saveBool(configKey, true);
    } else {
      _saveContent = configSaved!;
    }
    //await _localStorageService.delete(configKey);

    await _systemTray.initSystemTray(iconPath: "assets/images/icon.png");

    await _menuMain.buildFrom([
      MenuItemLabel(
        label: "tray.open".i18n(),
        onClicked: (menuItem) => _windowService.window.show(),
      ),
      MenuItemCheckbox(
        label: "tray.saveContent".i18n(),
        name: "tray.saveContent".i18n(),
        checked: _saveContent,
        onClicked: (state) async {
          MenuItemCheckbox? checkbox = _menuMain
              .findItemByName<MenuItemCheckbox>("tray.saveContent".i18n());

          _saveContent = !_saveContent;
          checkbox?.setCheck(_saveContent);
          await _localStorageService.saveBool(configKey, _saveContent);
          if(!_saveContent) await _localStorageService.delete("clipBoard");
        },
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
