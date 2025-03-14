import 'dart:async';
import 'dart:convert';

import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/data/services/clipboard_service.dart';
import 'package:clipboard_mac/app/data/services/local_storage_service.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:result_dart/result_dart.dart';

const String configKey = "configs";
const String clipBoardKey = "clipBoard";

class LocalClipboardRepository implements ClipboardRepository {
  final List<ClipboardItemModel> _history = [];

  final _historyController = StreamController<ClipboardItemModel>.broadcast();

  late final ClipboardService _clipboardService;
  late final LocalStorageService _localStorageService;

  LocalClipboardRepository({
    required ClipboardService clipboardService,
    required LocalStorageService localStorage,
  }) {
    _clipboardService = clipboardService;
    _localStorageService = localStorage;
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
  Future<List<ClipboardItemModel>> getClipBoardItens() async {
    final String? savedItens = await _localStorageService.getString(
      clipBoardKey,
    );
    if (savedItens == null) return [];
    final List<dynamic> decoded = jsonDecode(savedItens);
    final List<ClipboardItemModel> decodeItens =
        decoded.reversed
            .map((item) => ClipboardItemModel.fromJson(item))
            .toList();
    _history.addAll(decodeItens);
    return decodeItens;
  }

  void _add(ClipboardItemModel content) async {
    _history.add(content);
    _historyController.add(content);

    final bool configSaved = (await _localStorageService.getBool(configKey))!;
    if (configSaved) {
      await _localStorageService.saveString(clipBoardKey, jsonEncode(_history));
    }
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
