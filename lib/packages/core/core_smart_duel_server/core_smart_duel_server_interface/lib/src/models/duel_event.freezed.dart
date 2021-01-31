// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'duel_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SummonDuelEvent _$SummonDuelEventFromJson(Map<String, dynamic> json) {
  return _SummonDuelEvent.fromJson(json);
}

/// @nodoc
class _$SummonDuelEventTearOff {
  const _$SummonDuelEventTearOff();

// ignore: unused_element
  _SummonDuelEvent call(
      {@required String yugiohCardId, @required String zoneName}) {
    return _SummonDuelEvent(
      yugiohCardId: yugiohCardId,
      zoneName: zoneName,
    );
  }

// ignore: unused_element
  SummonDuelEvent fromJson(Map<String, Object> json) {
    return SummonDuelEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SummonDuelEvent = _$SummonDuelEventTearOff();

/// @nodoc
mixin _$SummonDuelEvent {
  String get yugiohCardId;
  String get zoneName;

  Map<String, dynamic> toJson();
  $SummonDuelEventCopyWith<SummonDuelEvent> get copyWith;
}

/// @nodoc
abstract class $SummonDuelEventCopyWith<$Res> {
  factory $SummonDuelEventCopyWith(
          SummonDuelEvent value, $Res Function(SummonDuelEvent) then) =
      _$SummonDuelEventCopyWithImpl<$Res>;
  $Res call({String yugiohCardId, String zoneName});
}

/// @nodoc
class _$SummonDuelEventCopyWithImpl<$Res>
    implements $SummonDuelEventCopyWith<$Res> {
  _$SummonDuelEventCopyWithImpl(this._value, this._then);

  final SummonDuelEvent _value;
  // ignore: unused_field
  final $Res Function(SummonDuelEvent) _then;

  @override
  $Res call({
    Object yugiohCardId = freezed,
    Object zoneName = freezed,
  }) {
    return _then(_value.copyWith(
      yugiohCardId: yugiohCardId == freezed
          ? _value.yugiohCardId
          : yugiohCardId as String,
      zoneName: zoneName == freezed ? _value.zoneName : zoneName as String,
    ));
  }
}

/// @nodoc
abstract class _$SummonDuelEventCopyWith<$Res>
    implements $SummonDuelEventCopyWith<$Res> {
  factory _$SummonDuelEventCopyWith(
          _SummonDuelEvent value, $Res Function(_SummonDuelEvent) then) =
      __$SummonDuelEventCopyWithImpl<$Res>;
  @override
  $Res call({String yugiohCardId, String zoneName});
}

/// @nodoc
class __$SummonDuelEventCopyWithImpl<$Res>
    extends _$SummonDuelEventCopyWithImpl<$Res>
    implements _$SummonDuelEventCopyWith<$Res> {
  __$SummonDuelEventCopyWithImpl(
      _SummonDuelEvent _value, $Res Function(_SummonDuelEvent) _then)
      : super(_value, (v) => _then(v as _SummonDuelEvent));

  @override
  _SummonDuelEvent get _value => super._value as _SummonDuelEvent;

  @override
  $Res call({
    Object yugiohCardId = freezed,
    Object zoneName = freezed,
  }) {
    return _then(_SummonDuelEvent(
      yugiohCardId: yugiohCardId == freezed
          ? _value.yugiohCardId
          : yugiohCardId as String,
      zoneName: zoneName == freezed ? _value.zoneName : zoneName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SummonDuelEvent implements _SummonDuelEvent {
  const _$_SummonDuelEvent(
      {@required this.yugiohCardId, @required this.zoneName})
      : assert(yugiohCardId != null),
        assert(zoneName != null);

  factory _$_SummonDuelEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_SummonDuelEventFromJson(json);

  @override
  final String yugiohCardId;
  @override
  final String zoneName;

  @override
  String toString() {
    return 'SummonDuelEvent(yugiohCardId: $yugiohCardId, zoneName: $zoneName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SummonDuelEvent &&
            (identical(other.yugiohCardId, yugiohCardId) ||
                const DeepCollectionEquality()
                    .equals(other.yugiohCardId, yugiohCardId)) &&
            (identical(other.zoneName, zoneName) ||
                const DeepCollectionEquality()
                    .equals(other.zoneName, zoneName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(yugiohCardId) ^
      const DeepCollectionEquality().hash(zoneName);

  @override
  _$SummonDuelEventCopyWith<_SummonDuelEvent> get copyWith =>
      __$SummonDuelEventCopyWithImpl<_SummonDuelEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummonDuelEventToJson(this);
  }
}

abstract class _SummonDuelEvent implements SummonDuelEvent {
  const factory _SummonDuelEvent(
      {@required String yugiohCardId,
      @required String zoneName}) = _$_SummonDuelEvent;

  factory _SummonDuelEvent.fromJson(Map<String, dynamic> json) =
      _$_SummonDuelEvent.fromJson;

  @override
  String get yugiohCardId;
  @override
  String get zoneName;
  @override
  _$SummonDuelEventCopyWith<_SummonDuelEvent> get copyWith;
}
