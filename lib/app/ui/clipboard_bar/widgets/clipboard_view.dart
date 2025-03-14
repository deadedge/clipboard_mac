import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

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
    return Scaffold(
      backgroundColor: Color(0xFF2C2C2C),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Fast clipboard",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => widget._windowService.window.hide(),
            icon: Icon(Icons.close, color: Colors.white.withValues(alpha: 120)),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget._clipboardBarViewModel,
        builder: (context, child) {
          final List<ClipboardItemModel> itens =
              widget._clipboardBarViewModel.clipBoardItens;
          return itens.isEmpty
              ? Center(child: Text("Não existe nada no clipboard"))
              : ListView.separated(
                itemBuilder: (context, index) {
                  switch (itens[index].type) {
                    case ClipboardContentType.text:
                      return ListTile(
                        title: Text(
                          itens[index].text!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        onTap: () => setClipBoard(itens[index]),
                      );
                    case ClipboardContentType.image:
                      return ListTile(
                        title: Image(image: MemoryImage(itens[index].image!)),
                        onTap: () => setClipBoard(itens[index]),
                      );

                    case ClipboardContentType.file:
                      return ListTile(
                        title: Text(itens[index].text!),
                        onTap: () => setClipBoard(itens[index]),
                      );
                  }
                },
                separatorBuilder:
                    (context, index) =>
                        Divider(height: 1, indent: 16, endIndent: 16),
                itemCount: itens.length,
              );
        },
      ),
    );
  }

  void setClipBoard(ClipboardItemModel item) =>
      widget._clipboardBarViewModel.setClipBoard(item);
}
