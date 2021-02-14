// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'summon_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SummonEvent _$SummonEventFromJson(Map<String, dynamic> json) {
  return _SummonEvent.fromJson(json);
}

/// @nodoc
class _$SummonEventTearOff {
  const _$SummonEventTearOff();

// ignore: unused_element
  _SummonEvent call(
      {@required String yugiohCardId, @required String zoneName}) {
    return _SummonEvent(
      yugiohCardId: yugiohCardId,
      zoneName: zoneName,
    );
  }

// ignore: unused_element
  SummonEvent fromJson(Map<String, Object> json) {
    return SummonEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SummonEvent = _$SummonEventTearOff();

/// @nodoc
mixin _$SummonEvent {
  String get yugiohCardId;
  String get zoneName;

  Map<String, dynamic> toJson();
  $SummonEventCopyWith<SummonEvent> get copyWith;
}

/// @nodoc
abstract class $SummonEventCopyWith<$Res> {
  factory $SummonEventCopyWith(
          SummonEvent value, $Res Function(SummonEvent) then) =
      _$SummonEventCopyWithImpl<$Res>;
  $Res call({String yugiohCardId, String zoneName});
}

/// @nodoc
class _$SummonEventCopyWithImpl<$Res> implements $SummonEventCopyWith<$Res> {
  _$SummonEventCopyWithImpl(this._value, this._then);

  final SummonEvent _value;
  // ignore: unused_field
  final $Res Function(SummonEvent) _then;

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
abstract class _$SummonEventCopyWith<$Res>
    implements $SummonEventCopyWith<$Res> {
  factory _$SummonEventCopyWith(
          _SummonEvent value, $Res Function(_SummonEvent) then) =
      __$SummonEventCopyWithImpl<$Res>;
  @override
  $Res call({String yugiohCardId, String zoneName});
}

/// @nodoc
class __$SummonEventCopyWithImpl<$Res> extends _$SummonEventCopyWithImpl<$Res>
    implements _$SummonEventCopyWith<$Res> {
  __$SummonEventCopyWithImpl(
      _SummonEvent _value, $Res Function(_SummonEvent) _then)
      : super(_value, (v) => _then(v as _SummonEvent));

  @override
  _SummonEvent get _value => super._value as _SummonEvent;

  @override
  $Res call({
    Object yugiohCardId = freezed,
    Object zoneName = freezed,
  }) {
    return _then(_SummonEvent(
      yugiohCardId: yugiohCardId == freezed
          ? _value.yugiohCardId
          : yugiohCardId as String,
      zoneName: zoneName == freezed ? _value.zoneName : zoneName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SummonEvent implements _SummonEvent {
  const _$_SummonEvent({@required this.yugiohCardId, @required this.zoneName})
      : assert(yugiohCardId != null),
        assert(zoneName != null);

  factory _$_SummonEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_SummonEventFromJson(json);

  @override
  final String yugiohCardId;
  @override
  final String zoneName;

  @override
  String toString() {
    return 'SummonEvent(yugiohCardId: $yugiohCardId, zoneName: $zoneName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SummonEvent &&
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
  _$SummonEventCopyWith<_SummonEvent> get copyWith =>
      __$SummonEventCopyWithImpl<_SummonEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SummonEventToJson(this);
  }
}

abstract class _SummonEvent implements SummonEvent {
  const factory _SummonEvent(
      {@required String yugiohCardId,
      @required String zoneName}) = _$_SummonEvent;

  factory _SummonEvent.fromJson(Map<String, dynamic> json) =
      _$_SummonEvent.fromJson;

  @override
  String get yugiohCardId;
  @override
  String get zoneName;
  @override
  _$SummonEventCopyWith<_SummonEvent> get copyWith;
}
