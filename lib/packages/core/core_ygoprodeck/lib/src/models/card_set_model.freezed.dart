// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardSetModel _$CardSetModelFromJson(Map<String, dynamic> json) {
  return _CardSetModel.fromJson(json);
}

/// @nodoc
class _$CardSetModelTearOff {
  const _$CardSetModelTearOff();

  _CardSetModel call(
      {@JsonKey(name: 'set_name') required String setName,
      @JsonKey(name: 'set_code') required String setCode,
      @JsonKey(name: 'set_rarity') required String setRarity,
      @JsonKey(name: 'set_rarity_code') required String setRarityCode,
      @JsonKey(name: 'set_price') required String setPrice}) {
    return _CardSetModel(
      setName: setName,
      setCode: setCode,
      setRarity: setRarity,
      setRarityCode: setRarityCode,
      setPrice: setPrice,
    );
  }

  CardSetModel fromJson(Map<String, Object> json) {
    return CardSetModel.fromJson(json);
  }
}

/// @nodoc
const $CardSetModel = _$CardSetModelTearOff();

/// @nodoc
mixin _$CardSetModel {
  @JsonKey(name: 'set_name')
  String get setName => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_code')
  String get setCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_rarity')
  String get setRarity => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_rarity_code')
  String get setRarityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_price')
  String get setPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardSetModelCopyWith<CardSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardSetModelCopyWith<$Res> {
  factory $CardSetModelCopyWith(
          CardSetModel value, $Res Function(CardSetModel) then) =
      _$CardSetModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'set_name') String setName,
      @JsonKey(name: 'set_code') String setCode,
      @JsonKey(name: 'set_rarity') String setRarity,
      @JsonKey(name: 'set_rarity_code') String setRarityCode,
      @JsonKey(name: 'set_price') String setPrice});
}

/// @nodoc
class _$CardSetModelCopyWithImpl<$Res> implements $CardSetModelCopyWith<$Res> {
  _$CardSetModelCopyWithImpl(this._value, this._then);

  final CardSetModel _value;
  // ignore: unused_field
  final $Res Function(CardSetModel) _then;

  @override
  $Res call({
    Object? setName = freezed,
    Object? setCode = freezed,
    Object? setRarity = freezed,
    Object? setRarityCode = freezed,
    Object? setPrice = freezed,
  }) {
    return _then(_value.copyWith(
      setName: setName == freezed
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String,
      setCode: setCode == freezed
          ? _value.setCode
          : setCode // ignore: cast_nullable_to_non_nullable
              as String,
      setRarity: setRarity == freezed
          ? _value.setRarity
          : setRarity // ignore: cast_nullable_to_non_nullable
              as String,
      setRarityCode: setRarityCode == freezed
          ? _value.setRarityCode
          : setRarityCode // ignore: cast_nullable_to_non_nullable
              as String,
      setPrice: setPrice == freezed
          ? _value.setPrice
          : setPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CardSetModelCopyWith<$Res>
    implements $CardSetModelCopyWith<$Res> {
  factory _$CardSetModelCopyWith(
          _CardSetModel value, $Res Function(_CardSetModel) then) =
      __$CardSetModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'set_name') String setName,
      @JsonKey(name: 'set_code') String setCode,
      @JsonKey(name: 'set_rarity') String setRarity,
      @JsonKey(name: 'set_rarity_code') String setRarityCode,
      @JsonKey(name: 'set_price') String setPrice});
}

/// @nodoc
class __$CardSetModelCopyWithImpl<$Res> extends _$CardSetModelCopyWithImpl<$Res>
    implements _$CardSetModelCopyWith<$Res> {
  __$CardSetModelCopyWithImpl(
      _CardSetModel _value, $Res Function(_CardSetModel) _then)
      : super(_value, (v) => _then(v as _CardSetModel));

  @override
  _CardSetModel get _value => super._value as _CardSetModel;

  @override
  $Res call({
    Object? setName = freezed,
    Object? setCode = freezed,
    Object? setRarity = freezed,
    Object? setRarityCode = freezed,
    Object? setPrice = freezed,
  }) {
    return _then(_CardSetModel(
      setName: setName == freezed
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String,
      setCode: setCode == freezed
          ? _value.setCode
          : setCode // ignore: cast_nullable_to_non_nullable
              as String,
      setRarity: setRarity == freezed
          ? _value.setRarity
          : setRarity // ignore: cast_nullable_to_non_nullable
              as String,
      setRarityCode: setRarityCode == freezed
          ? _value.setRarityCode
          : setRarityCode // ignore: cast_nullable_to_non_nullable
              as String,
      setPrice: setPrice == freezed
          ? _value.setPrice
          : setPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardSetModel implements _CardSetModel {
  const _$_CardSetModel(
      {@JsonKey(name: 'set_name') required this.setName,
      @JsonKey(name: 'set_code') required this.setCode,
      @JsonKey(name: 'set_rarity') required this.setRarity,
      @JsonKey(name: 'set_rarity_code') required this.setRarityCode,
      @JsonKey(name: 'set_price') required this.setPrice});

  factory _$_CardSetModel.fromJson(Map<String, dynamic> json) =>
      _$$_CardSetModelFromJson(json);

  @override
  @JsonKey(name: 'set_name')
  final String setName;
  @override
  @JsonKey(name: 'set_code')
  final String setCode;
  @override
  @JsonKey(name: 'set_rarity')
  final String setRarity;
  @override
  @JsonKey(name: 'set_rarity_code')
  final String setRarityCode;
  @override
  @JsonKey(name: 'set_price')
  final String setPrice;

  @override
  String toString() {
    return 'CardSetModel(setName: $setName, setCode: $setCode, setRarity: $setRarity, setRarityCode: $setRarityCode, setPrice: $setPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CardSetModel &&
            (identical(other.setName, setName) ||
                const DeepCollectionEquality()
                    .equals(other.setName, setName)) &&
            (identical(other.setCode, setCode) ||
                const DeepCollectionEquality()
                    .equals(other.setCode, setCode)) &&
            (identical(other.setRarity, setRarity) ||
                const DeepCollectionEquality()
                    .equals(other.setRarity, setRarity)) &&
            (identical(other.setRarityCode, setRarityCode) ||
                const DeepCollectionEquality()
                    .equals(other.setRarityCode, setRarityCode)) &&
            (identical(other.setPrice, setPrice) ||
                const DeepCollectionEquality()
                    .equals(other.setPrice, setPrice)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(setName) ^
      const DeepCollectionEquality().hash(setCode) ^
      const DeepCollectionEquality().hash(setRarity) ^
      const DeepCollectionEquality().hash(setRarityCode) ^
      const DeepCollectionEquality().hash(setPrice);

  @JsonKey(ignore: true)
  @override
  _$CardSetModelCopyWith<_CardSetModel> get copyWith =>
      __$CardSetModelCopyWithImpl<_CardSetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardSetModelToJson(this);
  }
}

abstract class _CardSetModel implements CardSetModel {
  const factory _CardSetModel(
      {@JsonKey(name: 'set_name') required String setName,
      @JsonKey(name: 'set_code') required String setCode,
      @JsonKey(name: 'set_rarity') required String setRarity,
      @JsonKey(name: 'set_rarity_code') required String setRarityCode,
      @JsonKey(name: 'set_price') required String setPrice}) = _$_CardSetModel;

  factory _CardSetModel.fromJson(Map<String, dynamic> json) =
      _$_CardSetModel.fromJson;

  @override
  @JsonKey(name: 'set_name')
  String get setName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'set_code')
  String get setCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'set_rarity')
  String get setRarity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'set_rarity_code')
  String get setRarityCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'set_price')
  String get setPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardSetModelCopyWith<_CardSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
