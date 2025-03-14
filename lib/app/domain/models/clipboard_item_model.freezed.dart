// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clipboard_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClipboardItemModel {

 ClipboardContentType get type; String? get text;// Apply the converter to the field
@Uint8ListConverter() Uint8List? get image; List<String>? get filePath;
/// Create a copy of ClipboardItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClipboardItemModelCopyWith<ClipboardItemModel> get copyWith => _$ClipboardItemModelCopyWithImpl<ClipboardItemModel>(this as ClipboardItemModel, _$identity);

  /// Serializes this ClipboardItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClipboardItemModel&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other.filePath, filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(filePath));

@override
String toString() {
  return 'ClipboardItemModel(type: $type, text: $text, image: $image, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $ClipboardItemModelCopyWith<$Res>  {
  factory $ClipboardItemModelCopyWith(ClipboardItemModel value, $Res Function(ClipboardItemModel) _then) = _$ClipboardItemModelCopyWithImpl;
@useResult
$Res call({
 ClipboardContentType type, String? text,@Uint8ListConverter() Uint8List? image, List<String>? filePath
});




}
/// @nodoc
class _$ClipboardItemModelCopyWithImpl<$Res>
    implements $ClipboardItemModelCopyWith<$Res> {
  _$ClipboardItemModelCopyWithImpl(this._self, this._then);

  final ClipboardItemModel _self;
  final $Res Function(ClipboardItemModel) _then;

/// Create a copy of ClipboardItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = freezed,Object? image = freezed,Object? filePath = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClipboardContentType,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ClipboardItemModel implements ClipboardItemModel {
  const _ClipboardItemModel({required this.type, this.text, @Uint8ListConverter() this.image, final  List<String>? filePath}): _filePath = filePath;
  factory _ClipboardItemModel.fromJson(Map<String, dynamic> json) => _$ClipboardItemModelFromJson(json);

@override final  ClipboardContentType type;
@override final  String? text;
// Apply the converter to the field
@override@Uint8ListConverter() final  Uint8List? image;
 final  List<String>? _filePath;
@override List<String>? get filePath {
  final value = _filePath;
  if (value == null) return null;
  if (_filePath is EqualUnmodifiableListView) return _filePath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ClipboardItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClipboardItemModelCopyWith<_ClipboardItemModel> get copyWith => __$ClipboardItemModelCopyWithImpl<_ClipboardItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClipboardItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClipboardItemModel&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other._filePath, _filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(_filePath));

@override
String toString() {
  return 'ClipboardItemModel(type: $type, text: $text, image: $image, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$ClipboardItemModelCopyWith<$Res> implements $ClipboardItemModelCopyWith<$Res> {
  factory _$ClipboardItemModelCopyWith(_ClipboardItemModel value, $Res Function(_ClipboardItemModel) _then) = __$ClipboardItemModelCopyWithImpl;
@override @useResult
$Res call({
 ClipboardContentType type, String? text,@Uint8ListConverter() Uint8List? image, List<String>? filePath
});




}
/// @nodoc
class __$ClipboardItemModelCopyWithImpl<$Res>
    implements _$ClipboardItemModelCopyWith<$Res> {
  __$ClipboardItemModelCopyWithImpl(this._self, this._then);

  final _ClipboardItemModel _self;
  final $Res Function(_ClipboardItemModel) _then;

/// Create a copy of ClipboardItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = freezed,Object? image = freezed,Object? filePath = freezed,}) {
  return _then(_ClipboardItemModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClipboardContentType,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List?,filePath: freezed == filePath ? _self._filePath : filePath // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
