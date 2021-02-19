// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'remove_card_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RemoveCardEvent _$RemoveCardEventFromJson(Map<String, dynamic> json) {
  return _RemoveCardEvent.fromJson(json);
}

/// @nodoc
class _$RemoveCardEventTearOff {
  const _$RemoveCardEventTearOff();

// ignore: unused_element
  _RemoveCardEvent call({@required String zoneName}) {
    return _RemoveCardEvent(
      zoneName: zoneName,
    );
  }

// ignore: unused_element
  RemoveCardEvent fromJson(Map<String, Object> json) {
    return RemoveCardEvent.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RemoveCardEvent = _$RemoveCardEventTearOff();

/// @nodoc
mixin _$RemoveCardEvent {
  String get zoneName;

  Map<String, dynamic> toJson();
  $RemoveCardEventCopyWith<RemoveCardEvent> get copyWith;
}

/// @nodoc
abstract class $RemoveCardEventCopyWith<$Res> {
  factory $RemoveCardEventCopyWith(
          RemoveCardEvent value, $Res Function(RemoveCardEvent) then) =
      _$RemoveCardEventCopyWithImpl<$Res>;
  $Res call({String zoneName});
}

/// @nodoc
class _$RemoveCardEventCopyWithImpl<$Res>
    implements $RemoveCardEventCopyWith<$Res> {
  _$RemoveCardEventCopyWithImpl(this._value, this._then);

  final RemoveCardEvent _value;
  // ignore: unused_field
  final $Res Function(RemoveCardEvent) _then;

  @override
  $Res call({
    Object zoneName = freezed,
  }) {
    return _then(_value.copyWith(
      zoneName: zoneName == freezed ? _value.zoneName : zoneName as String,
    ));
  }
}

/// @nodoc
abstract class _$RemoveCardEventCopyWith<$Res>
    implements $RemoveCardEventCopyWith<$Res> {
  factory _$RemoveCardEventCopyWith(
          _RemoveCardEvent value, $Res Function(_RemoveCardEvent) then) =
      __$RemoveCardEventCopyWithImpl<$Res>;
  @override
  $Res call({String zoneName});
}

/// @nodoc
class __$RemoveCardEventCopyWithImpl<$Res>
    extends _$RemoveCardEventCopyWithImpl<$Res>
    implements _$RemoveCardEventCopyWith<$Res> {
  __$RemoveCardEventCopyWithImpl(
      _RemoveCardEvent _value, $Res Function(_RemoveCardEvent) _then)
      : super(_value, (v) => _then(v as _RemoveCardEvent));

  @override
  _RemoveCardEvent get _value => super._value as _RemoveCardEvent;

  @override
  $Res call({
    Object zoneName = freezed,
  }) {
    return _then(_RemoveCardEvent(
      zoneName: zoneName == freezed ? _value.zoneName : zoneName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RemoveCardEvent implements _RemoveCardEvent {
  const _$_RemoveCardEvent({@required this.zoneName})
      : assert(zoneName != null);

  factory _$_RemoveCardEvent.fromJson(Map<String, dynamic> json) =>
      _$_$_RemoveCardEventFromJson(json);

  @override
  final String zoneName;

  @override
  String toString() {
    return 'RemoveCardEvent(zoneName: $zoneName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RemoveCardEvent &&
            (identical(other.zoneName, zoneName) ||
                const DeepCollectionEquality()
                    .equals(other.zoneName, zoneName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(zoneName);

  @override
  _$RemoveCardEventCopyWith<_RemoveCardEvent> get copyWith =>
      __$RemoveCardEventCopyWithImpl<_RemoveCardEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RemoveCardEventToJson(this);
  }
}

abstract class _RemoveCardEvent implements RemoveCardEvent {
  const factory _RemoveCardEvent({@required String zoneName}) =
      _$_RemoveCardEvent;

  factory _RemoveCardEvent.fromJson(Map<String, dynamic> json) =
      _$_RemoveCardEvent.fromJson;

  @override
  String get zoneName;
  @override
  _$RemoveCardEventCopyWith<_RemoveCardEvent> get copyWith;
}
