import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowService with WindowListener {
  late final WindowOptions windowOptions;

  WindowService();

  WindowOptions get windowOption => windowOptions;
  WindowManager get window => windowManager;

  init() async {
    WindowOptions windowOptions = WindowOptions(
      size: Size(300, 350),
      minimumSize: Size(300, 300),
      title: 'Fast Clipboard',
      center: false,
      
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setAsFrameless();
      await windowManager.setHasShadow(true);
      await windowManager.setMaximumSize(Size(550, 600));
      await windowManager.setBackgroundColor(Colors.transparent);
      await windowManager.setMovable(true);
      await windowManager.setAlwaysOnTop(true);
      await windowManager.setSkipTaskbar(true);
      await windowManager.setPreventClose(true);
      await windowManager.setVisibleOnAllWorkspaces(true);
     
    });
  }
}
