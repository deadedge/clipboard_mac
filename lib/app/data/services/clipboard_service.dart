import 'dart:async';

import 'package:clipboard_mac/app/data/exceptions/exceptions.dart';
import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:flutter/services.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:result_dart/result_dart.dart';

class ClipboardService with ClipboardListener {
  final _clipboardController = StreamController<ClipboardItemModel>.broadcast();
  Stream<ClipboardItemModel> get clipboardStream => _clipboardController.stream;
  bool _coolDown = false;
  ClipboardService() {
    _initClipboardWatcher();
  }

  void _initClipboardWatcher() {
    ClipboardWatcher.instance.addListener(this);
    ClipboardWatcher.instance.start();
  }

  AsyncResult<Unit> setClipBoard(ClipboardItemModel item) async {
    _coolDown = true;
    try {
      switch (item.type) {
        case ClipboardContentType.text:
          Pasteboard.writeText(item.text!);
        case ClipboardContentType.image:
          Pasteboard.writeImage(item.image!);
        case ClipboardContentType.file:
          Pasteboard.writeFiles(item.filePath!);
      }
      return Success(unit);
    } catch (e) {
      _coolDown = false;
      return Failure(WriteClipBoardError("Erro ao escrever no clipboard"));
    }
  }

  @override
  Future<void> onClipboardChanged() async {
    if (_coolDown) {
      _coolDown = false;
      return;
    }

    try {
      final String? text = await Pasteboard.text;
      final Uint8List? image = await Pasteboard.image;
      final List<String> files = await Pasteboard.files();

      if(image == null && files.isEmpty) return;

      if (text != null && files.isEmpty) {
        _clipboardController.add(
          ClipboardItemModel(type: ClipboardContentType.text, text: text),
        );
      } else if (image != null && files.isEmpty) {
        _clipboardController.add(
          ClipboardItemModel(type: ClipboardContentType.image, image: image),
        );
      } else {
        _clipboardController.add(
          ClipboardItemModel(
            type: ClipboardContentType.file,
            filePath: files,
            text: text,
            image: image,
          ),
        );
      }
    } catch (e) {
      print("error $e");
    }
  }

  void dispose() {
    ClipboardWatcher.instance.removeListener(this);
    ClipboardWatcher.instance.stop();
    _clipboardController.close();
  }
}
