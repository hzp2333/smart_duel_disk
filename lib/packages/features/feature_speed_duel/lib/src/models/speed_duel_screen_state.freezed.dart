// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'speed_duel_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpeedDuelScreenStateTearOff {
  const _$SpeedDuelScreenStateTearOff();

  SpeedDuelData call(SpeedDuelState state) {
    return SpeedDuelData(
      state,
    );
  }

  SpeedDuelLoading loading() {
    return const SpeedDuelLoading();
  }

  SpeedDuelError error() {
    return const SpeedDuelError();
  }
}

/// @nodoc
const $SpeedDuelScreenState = _$SpeedDuelScreenStateTearOff();

/// @nodoc
mixin _$SpeedDuelScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SpeedDuelState state) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SpeedDuelState state)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SpeedDuelData value) $default, {
    required TResult Function(SpeedDuelLoading value) loading,
    required TResult Function(SpeedDuelError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SpeedDuelData value)? $default, {
    TResult Function(SpeedDuelLoading value)? loading,
    TResult Function(SpeedDuelError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedDuelScreenStateCopyWith<$Res> {
  factory $SpeedDuelScreenStateCopyWith(SpeedDuelScreenState value,
          $Res Function(SpeedDuelScreenState) then) =
      _$SpeedDuelScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelScreenStateCopyWithImpl<$Res>
    implements $SpeedDuelScreenStateCopyWith<$Res> {
  _$SpeedDuelScreenStateCopyWithImpl(this._value, this._then);

  final SpeedDuelScreenState _value;
  // ignore: unused_field
  final $Res Function(SpeedDuelScreenState) _then;
}

/// @nodoc
abstract class $SpeedDuelDataCopyWith<$Res> {
  factory $SpeedDuelDataCopyWith(
          SpeedDuelData value, $Res Function(SpeedDuelData) then) =
      _$SpeedDuelDataCopyWithImpl<$Res>;
  $Res call({SpeedDuelState state});
}

/// @nodoc
class _$SpeedDuelDataCopyWithImpl<$Res>
    extends _$SpeedDuelScreenStateCopyWithImpl<$Res>
    implements $SpeedDuelDataCopyWith<$Res> {
  _$SpeedDuelDataCopyWithImpl(
      SpeedDuelData _value, $Res Function(SpeedDuelData) _then)
      : super(_value, (v) => _then(v as SpeedDuelData));

  @override
  SpeedDuelData get _value => super._value as SpeedDuelData;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(SpeedDuelData(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SpeedDuelState,
    ));
  }
}

/// @nodoc

class _$SpeedDuelData implements SpeedDuelData {
  const _$SpeedDuelData(this.state);

  @override
  final SpeedDuelState state;

  @override
  String toString() {
    return 'SpeedDuelScreenState(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpeedDuelData &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  $SpeedDuelDataCopyWith<SpeedDuelData> get copyWith =>
      _$SpeedDuelDataCopyWithImpl<SpeedDuelData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SpeedDuelState state) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return $default(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SpeedDuelState state)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SpeedDuelData value) $default, {
    required TResult Function(SpeedDuelLoading value) loading,
    required TResult Function(SpeedDuelError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SpeedDuelData value)? $default, {
    TResult Function(SpeedDuelLoading value)? loading,
    TResult Function(SpeedDuelError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelData implements SpeedDuelScreenState {
  const factory SpeedDuelData(SpeedDuelState state) = _$SpeedDuelData;

  SpeedDuelState get state => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeedDuelDataCopyWith<SpeedDuelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeedDuelLoadingCopyWith<$Res> {
  factory $SpeedDuelLoadingCopyWith(
          SpeedDuelLoading value, $Res Function(SpeedDuelLoading) then) =
      _$SpeedDuelLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpeedDuelLoadingCopyWithImpl<$Res>
    extends _$SpeedDuelScreenStateCopyWithImpl<$Res>
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
    return 'SpeedDuelScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpeedDuelLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SpeedDuelState state) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SpeedDuelState state)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SpeedDuelData value) $default, {
    required TResult Function(SpeedDuelLoading value) loading,
    required TResult Function(SpeedDuelError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SpeedDuelData value)? $default, {
    TResult Function(SpeedDuelLoading value)? loading,
    TResult Function(SpeedDuelError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelLoading implements SpeedDuelScreenState {
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
    extends _$SpeedDuelScreenStateCopyWithImpl<$Res>
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
    return 'SpeedDuelScreenState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpeedDuelError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SpeedDuelState state) $default, {
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SpeedDuelState state)? $default, {
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SpeedDuelData value) $default, {
    required TResult Function(SpeedDuelLoading value) loading,
    required TResult Function(SpeedDuelError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SpeedDuelData value)? $default, {
    TResult Function(SpeedDuelLoading value)? loading,
    TResult Function(SpeedDuelError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SpeedDuelError implements SpeedDuelScreenState {
  const factory SpeedDuelError() = _$SpeedDuelError;
}
