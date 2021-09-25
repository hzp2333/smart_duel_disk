// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_speed_duel_cards_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSpeedDuelCardsResponseModel _$GetSpeedDuelCardsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetSpeedDuelCardsResponseModel.fromJson(json);
}

/// @nodoc
class _$GetSpeedDuelCardsResponseModelTearOff {
  const _$GetSpeedDuelCardsResponseModelTearOff();

  _GetSpeedDuelCardsResponseModel call(
      {@JsonKey(name: 'data')
          required List<SpeedDuelCardModel> speedDuelCards}) {
    return _GetSpeedDuelCardsResponseModel(
      speedDuelCards: speedDuelCards,
    );
  }

  GetSpeedDuelCardsResponseModel fromJson(Map<String, Object> json) {
    return GetSpeedDuelCardsResponseModel.fromJson(json);
  }
}

/// @nodoc
const $GetSpeedDuelCardsResponseModel =
    _$GetSpeedDuelCardsResponseModelTearOff();

/// @nodoc
mixin _$GetSpeedDuelCardsResponseModel {
  @JsonKey(name: 'data')
  List<SpeedDuelCardModel> get speedDuelCards =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSpeedDuelCardsResponseModelCopyWith<GetSpeedDuelCardsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSpeedDuelCardsResponseModelCopyWith<$Res> {
  factory $GetSpeedDuelCardsResponseModelCopyWith(
          GetSpeedDuelCardsResponseModel value,
          $Res Function(GetSpeedDuelCardsResponseModel) then) =
      _$GetSpeedDuelCardsResponseModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') List<SpeedDuelCardModel> speedDuelCards});
}

/// @nodoc
class _$GetSpeedDuelCardsResponseModelCopyWithImpl<$Res>
    implements $GetSpeedDuelCardsResponseModelCopyWith<$Res> {
  _$GetSpeedDuelCardsResponseModelCopyWithImpl(this._value, this._then);

  final GetSpeedDuelCardsResponseModel _value;
  // ignore: unused_field
  final $Res Function(GetSpeedDuelCardsResponseModel) _then;

  @override
  $Res call({
    Object? speedDuelCards = freezed,
  }) {
    return _then(_value.copyWith(
      speedDuelCards: speedDuelCards == freezed
          ? _value.speedDuelCards
          : speedDuelCards // ignore: cast_nullable_to_non_nullable
              as List<SpeedDuelCardModel>,
    ));
  }
}

/// @nodoc
abstract class _$GetSpeedDuelCardsResponseModelCopyWith<$Res>
    implements $GetSpeedDuelCardsResponseModelCopyWith<$Res> {
  factory _$GetSpeedDuelCardsResponseModelCopyWith(
          _GetSpeedDuelCardsResponseModel value,
          $Res Function(_GetSpeedDuelCardsResponseModel) then) =
      __$GetSpeedDuelCardsResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') List<SpeedDuelCardModel> speedDuelCards});
}

/// @nodoc
class __$GetSpeedDuelCardsResponseModelCopyWithImpl<$Res>
    extends _$GetSpeedDuelCardsResponseModelCopyWithImpl<$Res>
    implements _$GetSpeedDuelCardsResponseModelCopyWith<$Res> {
  __$GetSpeedDuelCardsResponseModelCopyWithImpl(
      _GetSpeedDuelCardsResponseModel _value,
      $Res Function(_GetSpeedDuelCardsResponseModel) _then)
      : super(_value, (v) => _then(v as _GetSpeedDuelCardsResponseModel));

  @override
  _GetSpeedDuelCardsResponseModel get _value =>
      super._value as _GetSpeedDuelCardsResponseModel;

  @override
  $Res call({
    Object? speedDuelCards = freezed,
  }) {
    return _then(_GetSpeedDuelCardsResponseModel(
      speedDuelCards: speedDuelCards == freezed
          ? _value.speedDuelCards
          : speedDuelCards // ignore: cast_nullable_to_non_nullable
              as List<SpeedDuelCardModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetSpeedDuelCardsResponseModel
    implements _GetSpeedDuelCardsResponseModel {
  const _$_GetSpeedDuelCardsResponseModel(
      {@JsonKey(name: 'data') required this.speedDuelCards});

  factory _$_GetSpeedDuelCardsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_GetSpeedDuelCardsResponseModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<SpeedDuelCardModel> speedDuelCards;

  @override
  String toString() {
    return 'GetSpeedDuelCardsResponseModel(speedDuelCards: $speedDuelCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetSpeedDuelCardsResponseModel &&
            (identical(other.speedDuelCards, speedDuelCards) ||
                const DeepCollectionEquality()
                    .equals(other.speedDuelCards, speedDuelCards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(speedDuelCards);

  @JsonKey(ignore: true)
  @override
  _$GetSpeedDuelCardsResponseModelCopyWith<_GetSpeedDuelCardsResponseModel>
      get copyWith => __$GetSpeedDuelCardsResponseModelCopyWithImpl<
          _GetSpeedDuelCardsResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetSpeedDuelCardsResponseModelToJson(this);
  }
}

abstract class _GetSpeedDuelCardsResponseModel
    implements GetSpeedDuelCardsResponseModel {
  const factory _GetSpeedDuelCardsResponseModel(
          {@JsonKey(name: 'data')
              required List<SpeedDuelCardModel> speedDuelCards}) =
      _$_GetSpeedDuelCardsResponseModel;

  factory _GetSpeedDuelCardsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetSpeedDuelCardsResponseModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<SpeedDuelCardModel> get speedDuelCards =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetSpeedDuelCardsResponseModelCopyWith<_GetSpeedDuelCardsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
