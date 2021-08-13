// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'get_speed_duel_cards_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GetSpeedDuelCardsResponseModel _$GetSpeedDuelCardsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetSpeedDuelCardsResponseModel.fromJson(json);
}

/// @nodoc
class _$GetSpeedDuelCardsResponseModelTearOff {
  const _$GetSpeedDuelCardsResponseModelTearOff();

// ignore: unused_element
  _GetSpeedDuelCardsResponseModel call(
      {@required
      @JsonKey(name: 'data')
          List<SpeedDuelCardModel> speedDuelCards}) {
    return _GetSpeedDuelCardsResponseModel(
      speedDuelCards: speedDuelCards,
    );
  }

// ignore: unused_element
  GetSpeedDuelCardsResponseModel fromJson(Map<String, Object> json) {
    return GetSpeedDuelCardsResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GetSpeedDuelCardsResponseModel =
    _$GetSpeedDuelCardsResponseModelTearOff();

/// @nodoc
mixin _$GetSpeedDuelCardsResponseModel {
  @JsonKey(name: 'data')
  List<SpeedDuelCardModel> get speedDuelCards;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GetSpeedDuelCardsResponseModelCopyWith<GetSpeedDuelCardsResponseModel>
      get copyWith;
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
    Object speedDuelCards = freezed,
  }) {
    return _then(_value.copyWith(
      speedDuelCards: speedDuelCards == freezed
          ? _value.speedDuelCards
          : speedDuelCards as List<SpeedDuelCardModel>,
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
    Object speedDuelCards = freezed,
  }) {
    return _then(_GetSpeedDuelCardsResponseModel(
      speedDuelCards: speedDuelCards == freezed
          ? _value.speedDuelCards
          : speedDuelCards as List<SpeedDuelCardModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GetSpeedDuelCardsResponseModel
    implements _GetSpeedDuelCardsResponseModel {
  const _$_GetSpeedDuelCardsResponseModel(
      {@required @JsonKey(name: 'data') this.speedDuelCards})
      : assert(speedDuelCards != null);

  factory _$_GetSpeedDuelCardsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$_$_GetSpeedDuelCardsResponseModelFromJson(json);

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
    return _$_$_GetSpeedDuelCardsResponseModelToJson(this);
  }
}

abstract class _GetSpeedDuelCardsResponseModel
    implements GetSpeedDuelCardsResponseModel {
  const factory _GetSpeedDuelCardsResponseModel(
          {@required
          @JsonKey(name: 'data')
              List<SpeedDuelCardModel> speedDuelCards}) =
      _$_GetSpeedDuelCardsResponseModel;

  factory _GetSpeedDuelCardsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetSpeedDuelCardsResponseModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<SpeedDuelCardModel> get speedDuelCards;
  @override
  @JsonKey(ignore: true)
  _$GetSpeedDuelCardsResponseModelCopyWith<_GetSpeedDuelCardsResponseModel>
      get copyWith;
}
