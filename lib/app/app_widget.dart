import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/widgets/clipboard_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fast Clipboard",
      home: ClipboardView(
        clipboardBarViewModel: context.read<ClipboardBarViewModel>(),
        systemTrayService: context.read<SystemTrayService>(),
        windowService: context.read<WindowService>(),
        hotKeyService: context.read<HotkeyService>(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFE9E9E9),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF2C2C2C),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
