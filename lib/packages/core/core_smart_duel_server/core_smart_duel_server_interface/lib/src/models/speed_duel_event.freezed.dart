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
  SummonDuelEvent summon(SummonEvent data) {
    return SummonDuelEvent(
      data,
    );
  }

// ignore: unused_element
  RemoveCardDuelEvent removeCard(RemoveCardEvent data) {
    return RemoveCardDuelEvent(
      data,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SpeedDuelEvent = _$SpeedDuelEventTearOff();

/// @nodoc
mixin _$SpeedDuelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(SummonEvent data),
    @required TResult removeCard(RemoveCardEvent data),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(SummonEvent data),
    TResult removeCard(RemoveCardEvent data),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(SummonDuelEvent value),
    @required TResult removeCard(RemoveCardDuelEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(SummonDuelEvent value),
    TResult removeCard(RemoveCardDuelEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SpeedDuelEventCopyWith<$Res> {
  factory $SpeedDuelEventCopyWith(
          SpeedDuelEvent value, $Res Function(SpeedDuelEvent) then) =
      _$SpeedDuelEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelEventCopyWithImpl<$Res>
    implements $SpeedDuelEventCopyWith<$Res> {
  _$SpeedDuelEventCopyWithImpl(this._value, this._then);

  final SpeedDuelEvent _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelEvent) _then;
}

/// @nodoc
abstract class $SummonDuelEventCopyWith<$Res> {
  factory $SummonDuelEventCopyWith(
          SummonDuelEvent value, $Res Function(SummonDuelEvent) then) =
      _$SummonDuelEventCopyWithImpl<$Res>;
  $Res call({SummonEvent data});

  $SummonEventCopyWith<$Res> get data;
}

/// @nodoc
class _$SummonDuelEventCopyWithImpl<$Res>
    extends _$SpeedDuelEventCopyWithImpl<$Res>
    implements $SummonDuelEventCopyWith<$Res> {
  _$SummonDuelEventCopyWithImpl(
      SummonDuelEvent _value, $Res Function(SummonDuelEvent) _then)
      : super(_value, (v) => _then(v as SummonDuelEvent));

  @override
  SummonDuelEvent get _value => super._value as SummonDuelEvent;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(SummonDuelEvent(
      data == freezed ? _value.data : data as SummonEvent,
    ));
  }

  @override
  $SummonEventCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $SummonEventCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
class _$SummonDuelEvent implements SummonDuelEvent {
  const _$SummonDuelEvent(this.data) : assert(data != null);

  @override
  final SummonEvent data;

  @override
  String toString() {
    return 'SpeedDuelEvent.summon(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SummonDuelEvent &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $SummonDuelEventCopyWith<SummonDuelEvent> get copyWith =>
      _$SummonDuelEventCopyWithImpl<SummonDuelEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(SummonEvent data),
    @required TResult removeCard(RemoveCardEvent data),
  }) {
    assert(summon != null);
    assert(removeCard != null);
    return summon(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(SummonEvent data),
    TResult removeCard(RemoveCardEvent data),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (summon != null) {
      return summon(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(SummonDuelEvent value),
    @required TResult removeCard(RemoveCardDuelEvent value),
  }) {
    assert(summon != null);
    assert(removeCard != null);
    return summon(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(SummonDuelEvent value),
    TResult removeCard(RemoveCardDuelEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (summon != null) {
      return summon(this);
    }
    return orElse();
  }
}

abstract class SummonDuelEvent implements SpeedDuelEvent {
  const factory SummonDuelEvent(SummonEvent data) = _$SummonDuelEvent;

  SummonEvent get data;
  $SummonDuelEventCopyWith<SummonDuelEvent> get copyWith;
}

/// @nodoc
abstract class $RemoveCardDuelEventCopyWith<$Res> {
  factory $RemoveCardDuelEventCopyWith(
          RemoveCardDuelEvent value, $Res Function(RemoveCardDuelEvent) then) =
      _$RemoveCardDuelEventCopyWithImpl<$Res>;
  $Res call({RemoveCardEvent data});

  $RemoveCardEventCopyWith<$Res> get data;
}

/// @nodoc
class _$RemoveCardDuelEventCopyWithImpl<$Res>
    extends _$SpeedDuelEventCopyWithImpl<$Res>
    implements $RemoveCardDuelEventCopyWith<$Res> {
  _$RemoveCardDuelEventCopyWithImpl(
      RemoveCardDuelEvent _value, $Res Function(RemoveCardDuelEvent) _then)
      : super(_value, (v) => _then(v as RemoveCardDuelEvent));

  @override
  RemoveCardDuelEvent get _value => super._value as RemoveCardDuelEvent;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(RemoveCardDuelEvent(
      data == freezed ? _value.data : data as RemoveCardEvent,
    ));
  }

  @override
  $RemoveCardEventCopyWith<$Res> get data {
    if (_value.data == null) {
      return null;
    }
    return $RemoveCardEventCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
class _$RemoveCardDuelEvent implements RemoveCardDuelEvent {
  const _$RemoveCardDuelEvent(this.data) : assert(data != null);

  @override
  final RemoveCardEvent data;

  @override
  String toString() {
    return 'SpeedDuelEvent.removeCard(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemoveCardDuelEvent &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $RemoveCardDuelEventCopyWith<RemoveCardDuelEvent> get copyWith =>
      _$RemoveCardDuelEventCopyWithImpl<RemoveCardDuelEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(SummonEvent data),
    @required TResult removeCard(RemoveCardEvent data),
  }) {
    assert(summon != null);
    assert(removeCard != null);
    return removeCard(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(SummonEvent data),
    TResult removeCard(RemoveCardEvent data),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removeCard != null) {
      return removeCard(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(SummonDuelEvent value),
    @required TResult removeCard(RemoveCardDuelEvent value),
  }) {
    assert(summon != null);
    assert(removeCard != null);
    return removeCard(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(SummonDuelEvent value),
    TResult removeCard(RemoveCardDuelEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removeCard != null) {
      return removeCard(this);
    }
    return orElse();
  }
}

abstract class RemoveCardDuelEvent implements SpeedDuelEvent {
  const factory RemoveCardDuelEvent(RemoveCardEvent data) =
      _$RemoveCardDuelEvent;

  RemoveCardEvent get data;
  $RemoveCardDuelEventCopyWith<RemoveCardDuelEvent> get copyWith;
}
