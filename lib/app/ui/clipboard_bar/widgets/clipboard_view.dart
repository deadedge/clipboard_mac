import 'package:clipboard_mac/app/data/services/hotkey_service.dart';
import 'package:clipboard_mac/app/data/services/window_service.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/view_model/clipboard_bar_view_model.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/widgets/clipboard_item.dart';
import 'package:clipboard_mac/app/ui/clipboard_bar/widgets/selectable_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ClipboardView extends StatefulWidget {
  final ClipboardBarViewModel _clipboardBarViewModel;
  final WindowService _windowService;
  final HotkeyService _hotkeyService;
  const ClipboardView({
    super.key,
    required ClipboardBarViewModel clipboardBarViewModel,
    required WindowService windowService,
    required HotkeyService hotKeyService,
  }) : _clipboardBarViewModel = clipboardBarViewModel,
       _windowService = windowService,
       _hotkeyService = hotKeyService;

  @override
  State<ClipboardView> createState() => _ClipboardViewState();
}

class _ClipboardViewState extends State<ClipboardView> {
  final List<int> _itensToDelete = [];
  bool forceDeactive = false;

  @override
  void initState() {
    super.initState();
    widget._hotkeyService.init();
  }

  @override
  Widget build(BuildContext screenContext) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2C2C),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "window.title".i18n(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          if (_itensToDelete.isEmpty) ...[
            IconButton(
              tooltip: "appBarActions.delete".i18n(),
              onPressed: () => widget._clipboardBarViewModel.clearClipBoard(),
              icon: Icon(
                Icons.delete,
                color: Colors.red.withValues(alpha: 120),
              ),
            ),
          ] else ...[
            IconButton(
              tooltip: "appBarActions.deleteNumber".i18n([
                _itensToDelete.length.toString(),
              ]),
              onPressed: () {
                widget._clipboardBarViewModel.clearSelectedItens(
                  _itensToDelete,
                );
                setState(() {
                  forceDeactive = true;
                  _itensToDelete.clear();
                });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red.withValues(alpha: 120),
              ),
            ),
          ],
          IconButton(
            tooltip: "appBarActions.close".i18n(),
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
              ? Center(child: Text("window.noContent".i18n()))
              : SelectableListWidget(
                deactive: forceDeactive,
                onDeactive: () => forceDeactive = false,
                checkBoxColor: Colors.red.withValues(alpha: 120),
                separator: true,
                items: itens,
                onItemsSelected: (selecteds) {
                  setState(() {
                    _itensToDelete.clear();
                    _itensToDelete.addAll(selecteds);
                  });
                },
                itemBuilder: (itemContext, index) {
                  return MouseRegion(
                    child: InkWell(
                      onSecondaryTapDown: (details) {
                        showMenu(
                          context: itemContext,
                          position: RelativeRect.fromRect(
                            Rect.fromLTWH(
                              details.globalPosition.dx,
                              details.globalPosition.dy,
                              0,
                              0,
                            ),
                            Offset.zero & MediaQuery.of(context).size,
                          ),
                          items: [
                            PopupMenuItem(
                              child: Row(
                                spacing: 5,
                                children: [
                                  Icon(Icons.delete),
                                  Text("popupMenu.delete".i18n()),
                                ],
                              ),
                              onTap: () {
                                widget._clipboardBarViewModel
                                    .removeFromClipBoard(itens[index]);
                              },
                            ),
                          ],
                        );
                      },
                      child: ClipboardItem(
                        item: itens[index],
                        onClick: setClipBoard,
                      ),
                    ),
                  );
                },
              );
        },
      ),
    );
  }

  void setClipBoard(ClipboardItemModel item) =>
      widget._clipboardBarViewModel.setClipBoard(item);
}
