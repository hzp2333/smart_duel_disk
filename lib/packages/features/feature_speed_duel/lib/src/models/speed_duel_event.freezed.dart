// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'speed_duel_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SpeedDuelEventTearOff {
  const _$SpeedDuelEventTearOff();

// ignore: unused_element
  SpeedDuelInspectCardPileEvent inspectCardPile(Zone zone) {
    return SpeedDuelInspectCardPileEvent(
      zone,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SpeedDuelEvent = _$SpeedDuelEventTearOff();

/// @nodoc
mixin _$SpeedDuelEvent {
  Zone get zone;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult inspectCardPile(Zone zone),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult inspectCardPile(Zone zone),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
    @required TResult orElse(),
  });

  $SpeedDuelEventCopyWith<SpeedDuelEvent> get copyWith;
}

/// @nodoc
abstract class $SpeedDuelEventCopyWith<$Res> {
  factory $SpeedDuelEventCopyWith(
          SpeedDuelEvent value, $Res Function(SpeedDuelEvent) then) =
      _$SpeedDuelEventCopyWithImpl<$Res>;
  $Res call({Zone zone});
}

/// @nodoc
class _$SpeedDuelEventCopyWithImpl<$Res>
    implements $SpeedDuelEventCopyWith<$Res> {
  _$SpeedDuelEventCopyWithImpl(this._value, this._then);

  final SpeedDuelEvent _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelEvent) _then;

  @override
  $Res call({
    Object zone = freezed,
  }) {
    return _then(_value.copyWith(
      zone: zone == freezed ? _value.zone : zone as Zone,
    ));
  }
}

/// @nodoc
abstract class $SpeedDuelInspectCardPileEventCopyWith<$Res>
    implements $SpeedDuelEventCopyWith<$Res> {
  factory $SpeedDuelInspectCardPileEventCopyWith(
          SpeedDuelInspectCardPileEvent value,
          $Res Function(SpeedDuelInspectCardPileEvent) then) =
      _$SpeedDuelInspectCardPileEventCopyWithImpl<$Res>;
  @override
  $Res call({Zone zone});
}

/// @nodoc
class _$SpeedDuelInspectCardPileEventCopyWithImpl<$Res>
    extends _$SpeedDuelEventCopyWithImpl<$Res>
    implements $SpeedDuelInspectCardPileEventCopyWith<$Res> {
  _$SpeedDuelInspectCardPileEventCopyWithImpl(
      SpeedDuelInspectCardPileEvent _value,
      $Res Function(SpeedDuelInspectCardPileEvent) _then)
      : super(_value, (v) => _then(v as SpeedDuelInspectCardPileEvent));

  @override
  SpeedDuelInspectCardPileEvent get _value =>
      super._value as SpeedDuelInspectCardPileEvent;

  @override
  $Res call({
    Object zone = freezed,
  }) {
    return _then(SpeedDuelInspectCardPileEvent(
      zone == freezed ? _value.zone : zone as Zone,
    ));
  }
}

/// @nodoc
class _$SpeedDuelInspectCardPileEvent implements SpeedDuelInspectCardPileEvent {
  const _$SpeedDuelInspectCardPileEvent(this.zone) : assert(zone != null);

  @override
  final Zone zone;

  @override
  String toString() {
    return 'SpeedDuelEvent.inspectCardPile(zone: $zone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpeedDuelInspectCardPileEvent &&
            (identical(other.zone, zone) ||
                const DeepCollectionEquality().equals(other.zone, zone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(zone);

  @override
  $SpeedDuelInspectCardPileEventCopyWith<SpeedDuelInspectCardPileEvent>
      get copyWith => _$SpeedDuelInspectCardPileEventCopyWithImpl<
          SpeedDuelInspectCardPileEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult inspectCardPile(Zone zone),
  }) {
    assert(inspectCardPile != null);
    return inspectCardPile(zone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult inspectCardPile(Zone zone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (inspectCardPile != null) {
      return inspectCardPile(zone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
  }) {
    assert(inspectCardPile != null);
    return inspectCardPile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (inspectCardPile != null) {
      return inspectCardPile(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelInspectCardPileEvent implements SpeedDuelEvent {
  const factory SpeedDuelInspectCardPileEvent(Zone zone) =
      _$SpeedDuelInspectCardPileEvent;

  @override
  Zone get zone;
  @override
  $SpeedDuelInspectCardPileEventCopyWith<SpeedDuelInspectCardPileEvent>
      get copyWith;
}
