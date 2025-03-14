import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/widgets/clipboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/translates/'];

    return MaterialApp(
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('pt', '')],
      debugShowCheckedModeBanner: false,

      title: "window.title".i18n(),
      home: ClipboardView(
        clipboardBarViewModel: context.read<ClipboardBarViewModel>(),
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
