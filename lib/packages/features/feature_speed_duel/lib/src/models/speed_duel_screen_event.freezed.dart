// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'speed_duel_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SpeedDuelScreenEventTearOff {
  const _$SpeedDuelScreenEventTearOff();

// ignore: unused_element
  SpeedDuelHideOverlaysEvent hideOverlays() {
    return const SpeedDuelHideOverlaysEvent();
  }

// ignore: unused_element
  SpeedDuelInspectCardPileEvent inspectCardPile(Zone zone) {
    return SpeedDuelInspectCardPileEvent(
      zone,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SpeedDuelScreenEvent = _$SpeedDuelScreenEventTearOff();

/// @nodoc
mixin _$SpeedDuelScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult hideOverlays(),
    @required TResult inspectCardPile(Zone zone),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult hideOverlays(),
    TResult inspectCardPile(Zone zone),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
    @required TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
    TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SpeedDuelScreenEventCopyWith<$Res> {
  factory $SpeedDuelScreenEventCopyWith(SpeedDuelScreenEvent value,
          $Res Function(SpeedDuelScreenEvent) then) =
      _$SpeedDuelScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelScreenEventCopyWithImpl<$Res>
    implements $SpeedDuelScreenEventCopyWith<$Res> {
  _$SpeedDuelScreenEventCopyWithImpl(this._value, this._then);

  final SpeedDuelScreenEvent _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelScreenEvent) _then;
}

/// @nodoc
abstract class $SpeedDuelHideOverlaysEventCopyWith<$Res> {
  factory $SpeedDuelHideOverlaysEventCopyWith(SpeedDuelHideOverlaysEvent value,
          $Res Function(SpeedDuelHideOverlaysEvent) then) =
      _$SpeedDuelHideOverlaysEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelHideOverlaysEventCopyWithImpl<$Res>
    extends _$SpeedDuelScreenEventCopyWithImpl<$Res>
    implements $SpeedDuelHideOverlaysEventCopyWith<$Res> {
  _$SpeedDuelHideOverlaysEventCopyWithImpl(SpeedDuelHideOverlaysEvent _value,
      $Res Function(SpeedDuelHideOverlaysEvent) _then)
      : super(_value, (v) => _then(v as SpeedDuelHideOverlaysEvent));

  @override
  SpeedDuelHideOverlaysEvent get _value =>
      super._value as SpeedDuelHideOverlaysEvent;
}

/// @nodoc
class _$SpeedDuelHideOverlaysEvent implements SpeedDuelHideOverlaysEvent {
  const _$SpeedDuelHideOverlaysEvent();

  @override
  String toString() {
    return 'SpeedDuelScreenEvent.hideOverlays()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpeedDuelHideOverlaysEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult hideOverlays(),
    @required TResult inspectCardPile(Zone zone),
  }) {
    assert(hideOverlays != null);
    assert(inspectCardPile != null);
    return hideOverlays();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult hideOverlays(),
    TResult inspectCardPile(Zone zone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hideOverlays != null) {
      return hideOverlays();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
    @required TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
  }) {
    assert(hideOverlays != null);
    assert(inspectCardPile != null);
    return hideOverlays(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
    TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (hideOverlays != null) {
      return hideOverlays(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelHideOverlaysEvent implements SpeedDuelScreenEvent {
  const factory SpeedDuelHideOverlaysEvent() = _$SpeedDuelHideOverlaysEvent;
}

/// @nodoc
abstract class $SpeedDuelInspectCardPileEventCopyWith<$Res> {
  factory $SpeedDuelInspectCardPileEventCopyWith(
          SpeedDuelInspectCardPileEvent value,
          $Res Function(SpeedDuelInspectCardPileEvent) then) =
      _$SpeedDuelInspectCardPileEventCopyWithImpl<$Res>;
  $Res call({Zone zone});
}

/// @nodoc
class _$SpeedDuelInspectCardPileEventCopyWithImpl<$Res>
    extends _$SpeedDuelScreenEventCopyWithImpl<$Res>
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
    return 'SpeedDuelScreenEvent.inspectCardPile(zone: $zone)';
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
    @required TResult hideOverlays(),
    @required TResult inspectCardPile(Zone zone),
  }) {
    assert(hideOverlays != null);
    assert(inspectCardPile != null);
    return inspectCardPile(zone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult hideOverlays(),
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
    @required TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
    @required TResult inspectCardPile(SpeedDuelInspectCardPileEvent value),
  }) {
    assert(hideOverlays != null);
    assert(inspectCardPile != null);
    return inspectCardPile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult hideOverlays(SpeedDuelHideOverlaysEvent value),
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

abstract class SpeedDuelInspectCardPileEvent implements SpeedDuelScreenEvent {
  const factory SpeedDuelInspectCardPileEvent(Zone zone) =
      _$SpeedDuelInspectCardPileEvent;

  Zone get zone;
  $SpeedDuelInspectCardPileEventCopyWith<SpeedDuelInspectCardPileEvent>
      get copyWith;
}
