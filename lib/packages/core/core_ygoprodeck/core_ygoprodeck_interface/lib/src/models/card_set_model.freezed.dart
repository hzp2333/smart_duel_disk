// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'card_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CardSetModel _$CardSetModelFromJson(Map<String, dynamic> json) {
  return _CardSetModel.fromJson(json);
}

/// @nodoc
class _$CardSetModelTearOff {
  const _$CardSetModelTearOff();

// ignore: unused_element
  _CardSetModel call(
      {@required @JsonKey(name: 'set_name') String setName,
      @required @JsonKey(name: 'set_code') String setCode,
      @required @JsonKey(name: 'set_rarity') String setRarity,
      @required @JsonKey(name: 'set_rarity_code') String setRarityCode,
      @required @JsonKey(name: 'set_price') String setPrice}) {
    return _CardSetModel(
      setName: setName,
      setCode: setCode,
      setRarity: setRarity,
      setRarityCode: setRarityCode,
      setPrice: setPrice,
    );
  }

// ignore: unused_element
  CardSetModel fromJson(Map<String, Object> json) {
    return CardSetModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CardSetModel = _$CardSetModelTearOff();

/// @nodoc
mixin _$CardSetModel {
  @JsonKey(name: 'set_name')
  String get setName;
  @JsonKey(name: 'set_code')
  String get setCode;
  @JsonKey(name: 'set_rarity')
  String get setRarity;
  @JsonKey(name: 'set_rarity_code')
  String get setRarityCode;
  @JsonKey(name: 'set_price')
  String get setPrice;

  Map<String, dynamic> toJson();
  $CardSetModelCopyWith<CardSetModel> get copyWith;
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
    Object setName = freezed,
    Object setCode = freezed,
    Object setRarity = freezed,
    Object setRarityCode = freezed,
    Object setPrice = freezed,
  }) {
    return _then(_value.copyWith(
      setName: setName == freezed ? _value.setName : setName as String,
      setCode: setCode == freezed ? _value.setCode : setCode as String,
      setRarity: setRarity == freezed ? _value.setRarity : setRarity as String,
      setRarityCode: setRarityCode == freezed
          ? _value.setRarityCode
          : setRarityCode as String,
      setPrice: setPrice == freezed ? _value.setPrice : setPrice as String,
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
    Object setName = freezed,
    Object setCode = freezed,
    Object setRarity = freezed,
    Object setRarityCode = freezed,
    Object setPrice = freezed,
  }) {
    return _then(_CardSetModel(
      setName: setName == freezed ? _value.setName : setName as String,
      setCode: setCode == freezed ? _value.setCode : setCode as String,
      setRarity: setRarity == freezed ? _value.setRarity : setRarity as String,
      setRarityCode: setRarityCode == freezed
          ? _value.setRarityCode
          : setRarityCode as String,
      setPrice: setPrice == freezed ? _value.setPrice : setPrice as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CardSetModel implements _CardSetModel {
  const _$_CardSetModel(
      {@required @JsonKey(name: 'set_name') this.setName,
      @required @JsonKey(name: 'set_code') this.setCode,
      @required @JsonKey(name: 'set_rarity') this.setRarity,
      @required @JsonKey(name: 'set_rarity_code') this.setRarityCode,
      @required @JsonKey(name: 'set_price') this.setPrice})
      : assert(setName != null),
        assert(setCode != null),
        assert(setRarity != null),
        assert(setRarityCode != null),
        assert(setPrice != null);

  factory _$_CardSetModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CardSetModelFromJson(json);

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

  @override
  _$CardSetModelCopyWith<_CardSetModel> get copyWith =>
      __$CardSetModelCopyWithImpl<_CardSetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CardSetModelToJson(this);
  }
}

abstract class _CardSetModel implements CardSetModel {
  const factory _CardSetModel(
      {@required @JsonKey(name: 'set_name') String setName,
      @required @JsonKey(name: 'set_code') String setCode,
      @required @JsonKey(name: 'set_rarity') String setRarity,
      @required @JsonKey(name: 'set_rarity_code') String setRarityCode,
      @required @JsonKey(name: 'set_price') String setPrice}) = _$_CardSetModel;

  factory _CardSetModel.fromJson(Map<String, dynamic> json) =
      _$_CardSetModel.fromJson;

  @override
  @JsonKey(name: 'set_name')
  String get setName;
  @override
  @JsonKey(name: 'set_code')
  String get setCode;
  @override
  @JsonKey(name: 'set_rarity')
  String get setRarity;
  @override
  @JsonKey(name: 'set_rarity_code')
  String get setRarityCode;
  @override
  @JsonKey(name: 'set_price')
  String get setPrice;
  @override
  _$CardSetModelCopyWith<_CardSetModel> get copyWith;
}
