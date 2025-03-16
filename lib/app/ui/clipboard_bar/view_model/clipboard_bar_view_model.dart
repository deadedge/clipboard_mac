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

  void removeFromClipBoard(ClipboardItemModel item) async {
    _clipboardRepository.removeFromClipBoard(item);
    _history.remove(item);
    _lastManualSetClipBoard =
        _lastManualSetClipBoard == item ? null : _lastManualSetClipBoard;
    notifyListeners();
  }

  void clearClipBoard() {
    _clipboardRepository.clearClipBoard();
    _history.clear();
    _lastManualSetClipBoard = null;
    notifyListeners();
  }

  void clearSelectedItens(List<int> itensToDelete) {
    final List<ClipboardItemModel> _itensToDelete = [];
    for (var i = 0; i < _history.length; i++) {
      if (itensToDelete.contains(i)) {
        _itensToDelete.add(_history[i]);
        _history.removeAt(i);
      }
    }

    _clipboardRepository.clearSelectedItens(_itensToDelete);

    _lastManualSetClipBoard = null;
    notifyListeners();
  }
}
