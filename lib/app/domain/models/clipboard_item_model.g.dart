// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClipboardItemModel _$ClipboardItemModelFromJson(Map<String, dynamic> json) =>
    _ClipboardItemModel(
      type: $enumDecode(_$ClipboardContentTypeEnumMap, json['type']),
      copyAt: DateTime.parse(json['copyAt'] as String),
      id: json['id'] as String?,
      text: json['text'] as String?,
      image: const Uint8ListConverter().fromJson(json['image'] as String?),
      filePath:
          (json['filePath'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$ClipboardItemModelToJson(_ClipboardItemModel instance) =>
    <String, dynamic>{
      'type': _$ClipboardContentTypeEnumMap[instance.type]!,
      'copyAt': instance.copyAt.toIso8601String(),
      'id': instance.id,
      'text': instance.text,
      'image': const Uint8ListConverter().toJson(instance.image),
      'filePath': instance.filePath,
    };

const _$ClipboardContentTypeEnumMap = {
  ClipboardContentType.text: 'text',
  ClipboardContentType.image: 'image',
  ClipboardContentType.file: 'file',
};
