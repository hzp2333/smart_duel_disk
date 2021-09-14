// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'deck_builder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeckBuilderStateTearOff {
  const _$DeckBuilderStateTearOff();

  DeckBuilderData call(Iterable<YugiohCard> speedDuelCards,
      {required bool isPreBuilt}) {
    return DeckBuilderData(
      speedDuelCards,
      isPreBuilt: isPreBuilt,
    );
  }

  DeckBuilderLoading loading() {
    return const DeckBuilderLoading();
  }

  DeckBuilderNoData noData() {
    return const DeckBuilderNoData();
  }

  DeckBuilderError error() {
    return const DeckBuilderError();
  }
}

/// @nodoc
const $DeckBuilderState = _$DeckBuilderStateTearOff();

/// @nodoc
mixin _$DeckBuilderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)
        $default, {
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)?
        $default, {
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DeckBuilderData value) $default, {
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DeckBuilderData value)? $default, {
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckBuilderStateCopyWith<$Res> {
  factory $DeckBuilderStateCopyWith(
          DeckBuilderState value, $Res Function(DeckBuilderState) then) =
      _$DeckBuilderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderStateCopyWith<$Res> {
  _$DeckBuilderStateCopyWithImpl(this._value, this._then);

  final DeckBuilderState _value;
  // ignore: unused_field
  final $Res Function(DeckBuilderState) _then;
}

/// @nodoc
abstract class $DeckBuilderDataCopyWith<$Res> {
  factory $DeckBuilderDataCopyWith(
          DeckBuilderData value, $Res Function(DeckBuilderData) then) =
      _$DeckBuilderDataCopyWithImpl<$Res>;
  $Res call({Iterable<YugiohCard> speedDuelCards, bool isPreBuilt});
}

/// @nodoc
class _$DeckBuilderDataCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderDataCopyWith<$Res> {
  _$DeckBuilderDataCopyWithImpl(
      DeckBuilderData _value, $Res Function(DeckBuilderData) _then)
      : super(_value, (v) => _then(v as DeckBuilderData));

  @override
  DeckBuilderData get _value => super._value as DeckBuilderData;

  @override
  $Res call({
    Object? speedDuelCards = freezed,
    Object? isPreBuilt = freezed,
  }) {
    return _then(DeckBuilderData(
      speedDuelCards == freezed
          ? _value.speedDuelCards
          : speedDuelCards // ignore: cast_nullable_to_non_nullable
              as Iterable<YugiohCard>,
      isPreBuilt: isPreBuilt == freezed
          ? _value.isPreBuilt
          : isPreBuilt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeckBuilderData implements DeckBuilderData {
  const _$DeckBuilderData(this.speedDuelCards, {required this.isPreBuilt});

  @override
  final Iterable<YugiohCard> speedDuelCards;
  @override
  final bool isPreBuilt;

  @override
  String toString() {
    return 'DeckBuilderState(speedDuelCards: $speedDuelCards, isPreBuilt: $isPreBuilt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckBuilderData &&
            (identical(other.speedDuelCards, speedDuelCards) ||
                const DeepCollectionEquality()
                    .equals(other.speedDuelCards, speedDuelCards)) &&
            (identical(other.isPreBuilt, isPreBuilt) ||
                const DeepCollectionEquality()
                    .equals(other.isPreBuilt, isPreBuilt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(speedDuelCards) ^
      const DeepCollectionEquality().hash(isPreBuilt);

  @JsonKey(ignore: true)
  @override
  $DeckBuilderDataCopyWith<DeckBuilderData> get copyWith =>
      _$DeckBuilderDataCopyWithImpl<DeckBuilderData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)
        $default, {
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return $default(speedDuelCards, isPreBuilt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)?
        $default, {
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(speedDuelCards, isPreBuilt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DeckBuilderData value) $default, {
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DeckBuilderData value)? $default, {
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderData implements DeckBuilderState {
  const factory DeckBuilderData(Iterable<YugiohCard> speedDuelCards,
      {required bool isPreBuilt}) = _$DeckBuilderData;

  Iterable<YugiohCard> get speedDuelCards => throw _privateConstructorUsedError;
  bool get isPreBuilt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckBuilderDataCopyWith<DeckBuilderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckBuilderLoadingCopyWith<$Res> {
  factory $DeckBuilderLoadingCopyWith(
          DeckBuilderLoading value, $Res Function(DeckBuilderLoading) then) =
      _$DeckBuilderLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckBuilderLoadingCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderLoadingCopyWith<$Res> {
  _$DeckBuilderLoadingCopyWithImpl(
      DeckBuilderLoading _value, $Res Function(DeckBuilderLoading) _then)
      : super(_value, (v) => _then(v as DeckBuilderLoading));

  @override
  DeckBuilderLoading get _value => super._value as DeckBuilderLoading;
}

/// @nodoc

class _$DeckBuilderLoading implements DeckBuilderLoading {
  const _$DeckBuilderLoading();

  @override
  String toString() {
    return 'DeckBuilderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckBuilderLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)
        $default, {
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)?
        $default, {
    TResult Function()? loading,
    TResult Function()? noData,
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
    TResult Function(DeckBuilderData value) $default, {
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DeckBuilderData value)? $default, {
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderLoading implements DeckBuilderState {
  const factory DeckBuilderLoading() = _$DeckBuilderLoading;
}

/// @nodoc
abstract class $DeckBuilderNoDataCopyWith<$Res> {
  factory $DeckBuilderNoDataCopyWith(
          DeckBuilderNoData value, $Res Function(DeckBuilderNoData) then) =
      _$DeckBuilderNoDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckBuilderNoDataCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderNoDataCopyWith<$Res> {
  _$DeckBuilderNoDataCopyWithImpl(
      DeckBuilderNoData _value, $Res Function(DeckBuilderNoData) _then)
      : super(_value, (v) => _then(v as DeckBuilderNoData));

  @override
  DeckBuilderNoData get _value => super._value as DeckBuilderNoData;
}

/// @nodoc

class _$DeckBuilderNoData implements DeckBuilderNoData {
  const _$DeckBuilderNoData();

  @override
  String toString() {
    return 'DeckBuilderState.noData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckBuilderNoData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)
        $default, {
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)?
        $default, {
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DeckBuilderData value) $default, {
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DeckBuilderData value)? $default, {
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderNoData implements DeckBuilderState {
  const factory DeckBuilderNoData() = _$DeckBuilderNoData;
}

/// @nodoc
abstract class $DeckBuilderErrorCopyWith<$Res> {
  factory $DeckBuilderErrorCopyWith(
          DeckBuilderError value, $Res Function(DeckBuilderError) then) =
      _$DeckBuilderErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckBuilderErrorCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderErrorCopyWith<$Res> {
  _$DeckBuilderErrorCopyWithImpl(
      DeckBuilderError _value, $Res Function(DeckBuilderError) _then)
      : super(_value, (v) => _then(v as DeckBuilderError));

  @override
  DeckBuilderError get _value => super._value as DeckBuilderError;
}

/// @nodoc

class _$DeckBuilderError implements DeckBuilderError {
  const _$DeckBuilderError();

  @override
  String toString() {
    return 'DeckBuilderState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckBuilderError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)
        $default, {
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Iterable<YugiohCard> speedDuelCards, bool isPreBuilt)?
        $default, {
    TResult Function()? loading,
    TResult Function()? noData,
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
    TResult Function(DeckBuilderData value) $default, {
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DeckBuilderData value)? $default, {
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderError implements DeckBuilderState {
  const factory DeckBuilderError() = _$DeckBuilderError;
}
