import 'dart:io';

import 'package:clipboard_mac/app/domain/models/clipboard_item_model.dart';
import 'package:clipboard_mac/app/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ClipboardItem extends StatelessWidget {
  final ClipboardItemModel item;
  final Function(ClipboardItemModel) onClick;
  const ClipboardItem({super.key, required this.item, required this.onClick});

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case ClipboardContentType.text:
        return ListTile(
          title: Text(
            item.text!,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          onTap: () => onClick(item),
        );
      case ClipboardContentType.image:
        return ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: double.infinity,
            ),
            child: Image(image: MemoryImage(item.image!), fit: BoxFit.contain),
          ),
          onTap: () => onClick(item),
        );

      case ClipboardContentType.file:
        final String filePath = item.filePath!.first;
        final String text =
            item.filePath!.length > 1
                ? "${item.filePath!.length} ${"clipboardItem.files".i18n()}"
                : item.text ?? "clipboardItem.file".i18n();
        if (ImageUtils.isImage(filePath) && item.filePath!.length == 1) {
          final imageFile = File(filePath);

          return ListTile(
            contentPadding: EdgeInsets.all(16),
            title: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: double.infinity,
              ),
              child: Image.file(imageFile, fit: BoxFit.contain),
            ),
            onTap: () => onClick(item),
          );
        } else if (item.image != null) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
                  child: Image(
                    image: MemoryImage(item.image!),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(child: Text(text)),
              ],
            ),
            onTap: () => onClick(item),
          );
        }
        return Tooltip(
          message:
              item.filePath!.length > 1
                  ? item.filePath!
                      .map((element) => element.split("/").last)
                      .join('\n')
                  : "",
          child: ListTile(
            title: Row(
              spacing: 8,
              children: [Icon(Icons.file_copy), Text(text)],
            ),
            onTap: () => onClick(item),
          ),
        );
    }
  }
}
