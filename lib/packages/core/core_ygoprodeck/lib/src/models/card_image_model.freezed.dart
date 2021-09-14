// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'card_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardImageModel _$CardImageModelFromJson(Map<String, dynamic> json) {
  return _CardImageModel.fromJson(json);
}

/// @nodoc
class _$CardImageModelTearOff {
  const _$CardImageModelTearOff();

  _CardImageModel call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'image_url') required String imageUrl,
      @JsonKey(name: 'image_url_small') required String imageUrlSmall}) {
    return _CardImageModel(
      id: id,
      imageUrl: imageUrl,
      imageUrlSmall: imageUrlSmall,
    );
  }

  CardImageModel fromJson(Map<String, Object> json) {
    return CardImageModel.fromJson(json);
  }
}

/// @nodoc
const $CardImageModel = _$CardImageModelTearOff();

/// @nodoc
mixin _$CardImageModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url_small')
  String get imageUrlSmall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardImageModelCopyWith<CardImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardImageModelCopyWith<$Res> {
  factory $CardImageModelCopyWith(
          CardImageModel value, $Res Function(CardImageModel) then) =
      _$CardImageModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'image_url_small') String imageUrlSmall});
}

/// @nodoc
class _$CardImageModelCopyWithImpl<$Res>
    implements $CardImageModelCopyWith<$Res> {
  _$CardImageModelCopyWithImpl(this._value, this._then);

  final CardImageModel _value;
  // ignore: unused_field
  final $Res Function(CardImageModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? imageUrlSmall = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlSmall: imageUrlSmall == freezed
          ? _value.imageUrlSmall
          : imageUrlSmall // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CardImageModelCopyWith<$Res>
    implements $CardImageModelCopyWith<$Res> {
  factory _$CardImageModelCopyWith(
          _CardImageModel value, $Res Function(_CardImageModel) then) =
      __$CardImageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'image_url_small') String imageUrlSmall});
}

/// @nodoc
class __$CardImageModelCopyWithImpl<$Res>
    extends _$CardImageModelCopyWithImpl<$Res>
    implements _$CardImageModelCopyWith<$Res> {
  __$CardImageModelCopyWithImpl(
      _CardImageModel _value, $Res Function(_CardImageModel) _then)
      : super(_value, (v) => _then(v as _CardImageModel));

  @override
  _CardImageModel get _value => super._value as _CardImageModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? imageUrlSmall = freezed,
  }) {
    return _then(_CardImageModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlSmall: imageUrlSmall == freezed
          ? _value.imageUrlSmall
          : imageUrlSmall // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardImageModel implements _CardImageModel {
  const _$_CardImageModel(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'image_url_small') required this.imageUrlSmall});

  factory _$_CardImageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CardImageModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'image_url_small')
  final String imageUrlSmall;

  @override
  String toString() {
    return 'CardImageModel(id: $id, imageUrl: $imageUrl, imageUrlSmall: $imageUrlSmall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardImageModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageUrlSmall, imageUrlSmall) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrlSmall, imageUrlSmall)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageUrlSmall);

  @JsonKey(ignore: true)
  @override
  _$CardImageModelCopyWith<_CardImageModel> get copyWith =>
      __$CardImageModelCopyWithImpl<_CardImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CardImageModelToJson(this);
  }
}

abstract class _CardImageModel implements CardImageModel {
  const factory _CardImageModel(
          {@JsonKey(name: 'id') required int id,
          @JsonKey(name: 'image_url') required String imageUrl,
          @JsonKey(name: 'image_url_small') required String imageUrlSmall}) =
      _$_CardImageModel;

  factory _CardImageModel.fromJson(Map<String, dynamic> json) =
      _$_CardImageModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url_small')
  String get imageUrlSmall => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardImageModelCopyWith<_CardImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
