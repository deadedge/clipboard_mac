import 'dart:async';

import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/data/services/clipboard_service.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:result_dart/result_dart.dart';

class LocalClipboardRepository implements ClipboardRepository {
  final List<ClipboardItemModel> _history = [];
  final _historyController = StreamController<ClipboardItemModel>.broadcast();

  late final ClipboardService _clipboardService;

  LocalClipboardRepository({required ClipboardService clipboardService}) {
    _clipboardService = clipboardService;
    clipboardService.clipboardStream.listen(_add);
  }
  @override
  List<ClipboardItemModel> get clipBoardHistory => List.unmodifiable(_history);

  @override
  Stream<ClipboardItemModel> get clipBoardHistoryChanges =>
      _historyController.stream;

  @override
  void removeFromClipBoard(ClipboardItemModel content) {
    _history.remove(content);
  }

  @override
  AsyncResult<List<ClipboardItemModel>> getClipBoardItens() {
    // TODO: implement getClipBoardItens
    throw UnimplementedError();
  }

  void _add(ClipboardItemModel content) {
    _history.add(content);
    _historyController.add(content);
    return;
  }

  @override
  AsyncResult<Unit> setClipBoard(ClipboardItemModel content) async {
    return await _clipboardService.setClipBoard(content);
  }

  @override
  void dispose() {
    _historyController.close();
    _clipboardService.dispose();
  }
}