import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
part 'clipboard_item_model.freezed.dart';
part 'clipboard_item_model.g.dart';

// Create a custom JSON converter for Uint8List
class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    try {
      return base64Decode(json);
    } catch (e) {
      return null;
    }
  }

  @override
  String? toJson(Uint8List? bytes) {
    if (bytes == null) return null;
    return base64Encode(bytes);
  }
}

@freezed
sealed class ClipboardItemModel with _$ClipboardItemModel {
  const factory ClipboardItemModel({
    required final ClipboardContentType type,
    final String? text,
    // Apply the converter to the field
    @Uint8ListConverter() final Uint8List? image,
    final List<String>? filePath,
  }) = _ClipboardItemModel;


  factory ClipboardItemModel.fromJson(Map<String, dynamic> json) =>
      _$ClipboardItemModelFromJson(json);


}

enum ClipboardContentType { text, image, file }
