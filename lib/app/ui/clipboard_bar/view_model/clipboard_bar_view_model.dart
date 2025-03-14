import 'package:clipboard_mac/app/data/repositories/clipboard_repository.dart';
import 'package:clipboard_mac/app/data/services/system_tray_service.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:flutter/material.dart';

class ClipboardBarViewModel extends ChangeNotifier {
  late final ClipboardRepository _clipboardRepository;
  late final SystemTrayService _systemTrayService;
  final List<ClipboardItemModel> _history = [];

  ClipboardBarViewModel({
    required clipboardRepository,
    required systemTrayService,
  }) {
    _clipboardRepository = clipboardRepository;
    _systemTrayService = systemTrayService;
    _initListeners();
  }

  List<ClipboardItemModel> get clipBoardItens => List.unmodifiable(_history);

  void _initListeners() async {
    _clipboardRepository.clipBoardHistoryChanges.listen((
      ClipboardItemModel item,
    ) {
      _history.add(item);
      print("chegaram coisas ${item.type}");
    });
    
  }
}

