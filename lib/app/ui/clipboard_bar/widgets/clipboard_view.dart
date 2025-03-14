import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

class ClipboardView extends StatefulWidget {
  final ClipboardBarViewModel _clipboardBarViewModel;
  final SystemTrayService _systemTrayService;
  final WindowService _windowService;
  final HotkeyService _hotkeyService;
  const ClipboardView({
    super.key,
    required ClipboardBarViewModel clipboardBarViewModel,
    required SystemTrayService systemTrayService,
    required WindowService windowService,
    required HotkeyService hotKeyService,
  }) : _clipboardBarViewModel = clipboardBarViewModel,
       _systemTrayService = systemTrayService,
       _windowService = windowService,
       _hotkeyService = hotKeyService;

  @override
  State<ClipboardView> createState() => _ClipboardViewState();
}

class _ClipboardViewState extends State<ClipboardView> {
  @override
  void initState() {
    super.initState();
    widget._hotkeyService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
