// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ban_list_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BanListInfoModel _$BanListInfoModelFromJson(Map<String, dynamic> json) {
  return _BanListInfoModel.fromJson(json);
}

/// @nodoc
class _$BanListInfoModelTearOff {
  const _$BanListInfoModelTearOff();

// ignore: unused_element
  _BanListInfoModel call(
      {@JsonKey(name: 'ban_ocg') String banOcg,
      @JsonKey(name: 'ban_goat') String banGoat,
      @JsonKey(name: 'ban_tcg') String banTcg}) {
    return _BanListInfoModel(
      banOcg: banOcg,
      banGoat: banGoat,
      banTcg: banTcg,
    );
  }

// ignore: unused_element
  BanListInfoModel fromJson(Map<String, Object> json) {
    return BanListInfoModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BanListInfoModel = _$BanListInfoModelTearOff();

/// @nodoc
mixin _$BanListInfoModel {
  @JsonKey(name: 'ban_ocg')
  String get banOcg;
  @JsonKey(name: 'ban_goat')
  String get banGoat;
  @JsonKey(name: 'ban_tcg')
  String get banTcg;

  Map<String, dynamic> toJson();
  $BanListInfoModelCopyWith<BanListInfoModel> get copyWith;
}

/// @nodoc
abstract class $BanListInfoModelCopyWith<$Res> {
  factory $BanListInfoModelCopyWith(
          BanListInfoModel value, $Res Function(BanListInfoModel) then) =
      _$BanListInfoModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ban_ocg') String banOcg,
      @JsonKey(name: 'ban_goat') String banGoat,
      @JsonKey(name: 'ban_tcg') String banTcg});
}

/// @nodoc
class _$BanListInfoModelCopyWithImpl<$Res>
    implements $BanListInfoModelCopyWith<$Res> {
  _$BanListInfoModelCopyWithImpl(this._value, this._then);

  final BanListInfoModel _value;
  // ignore: unused_field
  final $Res Function(BanListInfoModel) _then;

  @override
  $Res call({
    Object banOcg = freezed,
    Object banGoat = freezed,
    Object banTcg = freezed,
  }) {
    return _then(_value.copyWith(
      banOcg: banOcg == freezed ? _value.banOcg : banOcg as String,
      banGoat: banGoat == freezed ? _value.banGoat : banGoat as String,
      banTcg: banTcg == freezed ? _value.banTcg : banTcg as String,
    ));
  }
}

/// @nodoc
abstract class _$BanListInfoModelCopyWith<$Res>
    implements $BanListInfoModelCopyWith<$Res> {
  factory _$BanListInfoModelCopyWith(
          _BanListInfoModel value, $Res Function(_BanListInfoModel) then) =
      __$BanListInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ban_ocg') String banOcg,
      @JsonKey(name: 'ban_goat') String banGoat,
      @JsonKey(name: 'ban_tcg') String banTcg});
}

/// @nodoc
class __$BanListInfoModelCopyWithImpl<$Res>
    extends _$BanListInfoModelCopyWithImpl<$Res>
    implements _$BanListInfoModelCopyWith<$Res> {
  __$BanListInfoModelCopyWithImpl(
      _BanListInfoModel _value, $Res Function(_BanListInfoModel) _then)
      : super(_value, (v) => _then(v as _BanListInfoModel));

  @override
  _BanListInfoModel get _value => super._value as _BanListInfoModel;

  @override
  $Res call({
    Object banOcg = freezed,
    Object banGoat = freezed,
    Object banTcg = freezed,
  }) {
    return _then(_BanListInfoModel(
      banOcg: banOcg == freezed ? _value.banOcg : banOcg as String,
      banGoat: banGoat == freezed ? _value.banGoat : banGoat as String,
      banTcg: banTcg == freezed ? _value.banTcg : banTcg as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BanListInfoModel implements _BanListInfoModel {
  const _$_BanListInfoModel(
      {@JsonKey(name: 'ban_ocg') this.banOcg,
      @JsonKey(name: 'ban_goat') this.banGoat,
      @JsonKey(name: 'ban_tcg') this.banTcg});

  factory _$_BanListInfoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BanListInfoModelFromJson(json);

  @override
  @JsonKey(name: 'ban_ocg')
  final String banOcg;
  @override
  @JsonKey(name: 'ban_goat')
  final String banGoat;
  @override
  @JsonKey(name: 'ban_tcg')
  final String banTcg;

  @override
  String toString() {
    return 'BanListInfoModel(banOcg: $banOcg, banGoat: $banGoat, banTcg: $banTcg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BanListInfoModel &&
            (identical(other.banOcg, banOcg) ||
                const DeepCollectionEquality().equals(other.banOcg, banOcg)) &&
            (identical(other.banGoat, banGoat) ||
                const DeepCollectionEquality()
                    .equals(other.banGoat, banGoat)) &&
            (identical(other.banTcg, banTcg) ||
                const DeepCollectionEquality().equals(other.banTcg, banTcg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(banOcg) ^
      const DeepCollectionEquality().hash(banGoat) ^
      const DeepCollectionEquality().hash(banTcg);

  @override
  _$BanListInfoModelCopyWith<_BanListInfoModel> get copyWith =>
      __$BanListInfoModelCopyWithImpl<_BanListInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BanListInfoModelToJson(this);
  }
}

abstract class _BanListInfoModel implements BanListInfoModel {
  const factory _BanListInfoModel(
      {@JsonKey(name: 'ban_ocg') String banOcg,
      @JsonKey(name: 'ban_goat') String banGoat,
      @JsonKey(name: 'ban_tcg') String banTcg}) = _$_BanListInfoModel;

  factory _BanListInfoModel.fromJson(Map<String, dynamic> json) =
      _$_BanListInfoModel.fromJson;

  @override
  @JsonKey(name: 'ban_ocg')
  String get banOcg;
  @override
  @JsonKey(name: 'ban_goat')
  String get banGoat;
  @override
  @JsonKey(name: 'ban_tcg')
  String get banTcg;
  @override
  _$BanListInfoModelCopyWith<_BanListInfoModel> get copyWith;
}
