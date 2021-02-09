// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'speed_duel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SpeedDuelStateTearOff {
  const _$SpeedDuelStateTearOff();

// ignore: unused_element
  SpeedDuelData call(PlayerState playerState) {
    return SpeedDuelData(
      playerState,
    );
  }

// ignore: unused_element
  SpeedDuelLoading loading() {
    return const SpeedDuelLoading();
  }

// ignore: unused_element
  SpeedDuelError error() {
    return const SpeedDuelError();
  }
}

/// @nodoc
// ignore: unused_element
const $SpeedDuelState = _$SpeedDuelStateTearOff();

/// @nodoc
mixin _$SpeedDuelState {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    @required TResult loading(),
    @required TResult error(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    @required TResult loading(SpeedDuelLoading value),
    @required TResult error(SpeedDuelError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    TResult loading(SpeedDuelLoading value),
    TResult error(SpeedDuelError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SpeedDuelStateCopyWith<$Res> {
  factory $SpeedDuelStateCopyWith(
          SpeedDuelState value, $Res Function(SpeedDuelState) then) =
      _$SpeedDuelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelStateCopyWithImpl<$Res>
    implements $SpeedDuelStateCopyWith<$Res> {
  _$SpeedDuelStateCopyWithImpl(this._value, this._then);

  final SpeedDuelState _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelState) _then;
}

/// @nodoc
abstract class $SpeedDuelDataCopyWith<$Res> {
  factory $SpeedDuelDataCopyWith(
          SpeedDuelData value, $Res Function(SpeedDuelData) then) =
      _$SpeedDuelDataCopyWithImpl<$Res>;
  $Res call({PlayerState playerState});
}

/// @nodoc
class _$SpeedDuelDataCopyWithImpl<$Res>
    extends _$SpeedDuelStateCopyWithImpl<$Res>
    implements $SpeedDuelDataCopyWith<$Res> {
  _$SpeedDuelDataCopyWithImpl(
      SpeedDuelData _value, $Res Function(SpeedDuelData) _then)
      : super(_value, (v) => _then(v as SpeedDuelData));

  @override
  SpeedDuelData get _value => super._value as SpeedDuelData;

  @override
  $Res call({
    Object playerState = freezed,
  }) {
    return _then(SpeedDuelData(
      playerState == freezed ? _value.playerState : playerState as PlayerState,
    ));
  }
}

/// @nodoc
class _$SpeedDuelData implements SpeedDuelData {
  const _$SpeedDuelData(this.playerState) : assert(playerState != null);

  @override
  final PlayerState playerState;

  @override
  String toString() {
    return 'SpeedDuelState(playerState: $playerState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpeedDuelData &&
            (identical(other.playerState, playerState) ||
                const DeepCollectionEquality()
                    .equals(other.playerState, playerState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(playerState);

  @override
  $SpeedDuelDataCopyWith<SpeedDuelData> get copyWith =>
      _$SpeedDuelDataCopyWithImpl<SpeedDuelData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(playerState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(playerState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    @required TResult loading(SpeedDuelLoading value),
    @required TResult error(SpeedDuelError value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    TResult loading(SpeedDuelLoading value),
    TResult error(SpeedDuelError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelData implements SpeedDuelState {
  const factory SpeedDuelData(PlayerState playerState) = _$SpeedDuelData;

  PlayerState get playerState;
  $SpeedDuelDataCopyWith<SpeedDuelData> get copyWith;
}

/// @nodoc
abstract class $SpeedDuelLoadingCopyWith<$Res> {
  factory $SpeedDuelLoadingCopyWith(
          SpeedDuelLoading value, $Res Function(SpeedDuelLoading) then) =
      _$SpeedDuelLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelLoadingCopyWithImpl<$Res>
    extends _$SpeedDuelStateCopyWithImpl<$Res>
    implements $SpeedDuelLoadingCopyWith<$Res> {
  _$SpeedDuelLoadingCopyWithImpl(
      SpeedDuelLoading _value, $Res Function(SpeedDuelLoading) _then)
      : super(_value, (v) => _then(v as SpeedDuelLoading));

  @override
  SpeedDuelLoading get _value => super._value as SpeedDuelLoading;
}

/// @nodoc
class _$SpeedDuelLoading implements SpeedDuelLoading {
  const _$SpeedDuelLoading();

  @override
  String toString() {
    return 'SpeedDuelState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpeedDuelLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    @required TResult loading(SpeedDuelLoading value),
    @required TResult error(SpeedDuelError value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    TResult loading(SpeedDuelLoading value),
    TResult error(SpeedDuelError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelLoading implements SpeedDuelState {
  const factory SpeedDuelLoading() = _$SpeedDuelLoading;
}

/// @nodoc
abstract class $SpeedDuelErrorCopyWith<$Res> {
  factory $SpeedDuelErrorCopyWith(
          SpeedDuelError value, $Res Function(SpeedDuelError) then) =
      _$SpeedDuelErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelErrorCopyWithImpl<$Res>
    extends _$SpeedDuelStateCopyWithImpl<$Res>
    implements $SpeedDuelErrorCopyWith<$Res> {
  _$SpeedDuelErrorCopyWithImpl(
      SpeedDuelError _value, $Res Function(SpeedDuelError) _then)
      : super(_value, (v) => _then(v as SpeedDuelError));

  @override
  SpeedDuelError get _value => super._value as SpeedDuelError;
}

/// @nodoc
class _$SpeedDuelError implements SpeedDuelError {
  const _$SpeedDuelError();

  @override
  String toString() {
    return 'SpeedDuelState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpeedDuelError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(PlayerState playerState), {
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    @required TResult loading(SpeedDuelLoading value),
    @required TResult error(SpeedDuelError value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(SpeedDuelData value), {
    TResult loading(SpeedDuelLoading value),
    TResult error(SpeedDuelError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelError implements SpeedDuelState {
  const factory SpeedDuelError() = _$SpeedDuelError;
}
