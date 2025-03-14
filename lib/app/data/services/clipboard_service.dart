import 'dart:async';

import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:flutter/services.dart';
import 'package:pasteboard/pasteboard.dart';

class ClipboardService with ClipboardListener {
  final _clipboardController = StreamController<ClipboardItemModel>.broadcast();
  Stream<ClipboardItemModel> get clipboardStream => _clipboardController.stream;

  ClipboardService() {
    _initClipboardWatcher();
  }

  void _initClipboardWatcher() {
    ClipboardWatcher.instance.addListener(this);
    ClipboardWatcher.instance.start();
  }

  @override
  Future<void> onClipboardChanged() async {
    try {
      final String? text = await Pasteboard.text;
      final Uint8List? image = await Pasteboard.image;
      final List<String> files = await Pasteboard.files();

      if (text != null) {
        _clipboardController.add(
          ClipboardItemModel.newItem(
            type: ClipboardContentType.text,
            text: text,
          ),
        );
        //print("foi texto: $text");
      } else if (image != null) {
        _clipboardController.add(
          ClipboardItemModel.newItem(
            type: ClipboardContentType.image,
            image: image,
          ),
        );
        //print("foi imagem: $image");
      } else {
        _clipboardController.add(
          ClipboardItemModel.newItem(
            type: ClipboardContentType.file,
            filePath: files,
          ),
        );
        //print("foi ficheiro: $files");
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
