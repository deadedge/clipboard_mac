import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:flutter/material.dart';

class ClipboardBarViewModel extends ChangeNotifier {
  late final ClipboardRepository _clipboardRepository;
  final List<ClipboardItemModel> _history = [];
  ClipboardItemModel? _lastManualSetClipBoard;
  ClipboardBarViewModel({required clipboardRepository}) {
    _clipboardRepository = clipboardRepository;
    _initListeners();
  }

  List<ClipboardItemModel> get clipBoardItens => List.unmodifiable(_history);

  void _initListeners() async {
    _clipboardRepository.clipBoardHistoryChanges.listen((
      ClipboardItemModel item,
    ) {
      if (item.type == ClipboardContentType.text && item.text!.trim().isEmpty) {
        return;
      }

      if (_history.isEmpty ||
          (_history.first != item && _lastManualSetClipBoard != item)) {
        _history.insert(0, item);
      }

      notifyListeners();
    });
  }

  Future<void> setClipBoard(ClipboardItemModel item) async {
    _clipboardRepository.setClipBoard(item);
    _lastManualSetClipBoard = item;
  }
}
