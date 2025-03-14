import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:flutter/material.dart';

class ClipboardBarViewModel extends ChangeNotifier {
  late final ClipboardRepository _clipboardRepository;
  final List<ClipboardItemModel> _history = [];
  ClipboardItemModel? _lastManualSetClipBoard;
  ClipboardBarViewModel({required clipboardRepository}) {
    _clipboardRepository = clipboardRepository;
    _getInitialData();
  }

  List<ClipboardItemModel> get clipBoardItens => List.unmodifiable(_history);

  Future<void> _getInitialData() async {
    _history.addAll(await _clipboardRepository.getClipBoardItens());
    _initListeners();
  }

  void _initListeners() async {
    _clipboardRepository.clipBoardHistoryChanges.listen((
      ClipboardItemModel item,
    ) {
      if (item.type == ClipboardContentType.text && item.text!.trim().isEmpty) {
        return;
      }

      if (_history.isEmpty || (_history.first != item)) {
        _history.insert(0, item);
      }

      notifyListeners();
    });
  }

  Future<void> setClipBoard(ClipboardItemModel item) async {
    _clipboardRepository.setClipBoard(item);
    _lastManualSetClipBoard = item;
  }

  Future<void> removeFromClipBoard(ClipboardItemModel item) async {
    _clipboardRepository.removeFromClipBoard(item);
    _history.remove(item);
    _lastManualSetClipBoard =
        _lastManualSetClipBoard == item ? null : _lastManualSetClipBoard;
    notifyListeners();
  }
}
