import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/data/repositories/local_clipboard_repository.dart';
import 'package:clipboard_mac/app/data/services/clipboard_service.dart';
import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider<ClipboardService>(create: (context) => ClipboardService()),
    Provider<WindowService>(create: (context) => WindowService()),
    Provider<HotkeyService>(create: (context) => HotkeyService(windowsService: context.read<WindowService>())),
    Provider<SystemTrayService>(
      create:
          (context) =>
              SystemTrayService(windowService: context.read<WindowService>()),
    ),
    Provider<ClipboardRepository>(
      create:
          (context) => LocalClipboardRepository(
            clipboardService: context.read<ClipboardService>(),
          ),
    ),
    ChangeNotifierProvider(
      create:
          (context) => ClipboardBarViewModel(
            clipboardRepository: context.read<ClipboardRepository>(),
          ),
    ),
  ];
}
