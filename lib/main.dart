import 'dart:io';

import 'package:clipboard_mac/app/app_widget.dart';
import 'package:clipboard_mac/app/config/dependencies.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  runApp(
    MultiProvider(
      providers: providers,
      child: AppWidget(),
      builder: (context, child) {
        Future.microtask(() async {
          final SystemTrayService _systemTrayService =
              context.read<SystemTrayService>();
          final WindowService _windowService = context.read<WindowService>();
          await _systemTrayService.initialize();
          await _windowService.init();
        });
        return child!;
      },
    ),
  );
}
