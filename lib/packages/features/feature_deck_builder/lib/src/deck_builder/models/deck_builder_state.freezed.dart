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

  DeckBuilderFiltered filtered(Iterable<YugiohCard> cards) {
    return DeckBuilderFiltered(
      cards,
    );
  }

  DeckBuilderPreBuilt preBuilt(Iterable<DeckBuilderSection> sections) {
    return DeckBuilderPreBuilt(
      sections,
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
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
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
abstract class $DeckBuilderFilteredCopyWith<$Res> {
  factory $DeckBuilderFilteredCopyWith(
          DeckBuilderFiltered value, $Res Function(DeckBuilderFiltered) then) =
      _$DeckBuilderFilteredCopyWithImpl<$Res>;
  $Res call({Iterable<YugiohCard> cards});
}

/// @nodoc
class _$DeckBuilderFilteredCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderFilteredCopyWith<$Res> {
  _$DeckBuilderFilteredCopyWithImpl(
      DeckBuilderFiltered _value, $Res Function(DeckBuilderFiltered) _then)
      : super(_value, (v) => _then(v as DeckBuilderFiltered));

  @override
  DeckBuilderFiltered get _value => super._value as DeckBuilderFiltered;

  @override
  $Res call({
    Object? cards = freezed,
  }) {
    return _then(DeckBuilderFiltered(
      cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Iterable<YugiohCard>,
    ));
  }
}

/// @nodoc

class _$DeckBuilderFiltered implements DeckBuilderFiltered {
  const _$DeckBuilderFiltered(this.cards);

  @override
  final Iterable<YugiohCard> cards;

  @override
  String toString() {
    return 'DeckBuilderState.filtered(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckBuilderFiltered &&
            (identical(other.cards, cards) ||
                const DeepCollectionEquality().equals(other.cards, cards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cards);

  @JsonKey(ignore: true)
  @override
  $DeckBuilderFilteredCopyWith<DeckBuilderFiltered> get copyWith =>
      _$DeckBuilderFilteredCopyWithImpl<DeckBuilderFiltered>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return filtered(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderFiltered implements DeckBuilderState {
  const factory DeckBuilderFiltered(Iterable<YugiohCard> cards) =
      _$DeckBuilderFiltered;

  Iterable<YugiohCard> get cards => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckBuilderFilteredCopyWith<DeckBuilderFiltered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckBuilderPreBuiltCopyWith<$Res> {
  factory $DeckBuilderPreBuiltCopyWith(
          DeckBuilderPreBuilt value, $Res Function(DeckBuilderPreBuilt) then) =
      _$DeckBuilderPreBuiltCopyWithImpl<$Res>;
  $Res call({Iterable<DeckBuilderSection> sections});
}

/// @nodoc
class _$DeckBuilderPreBuiltCopyWithImpl<$Res>
    extends _$DeckBuilderStateCopyWithImpl<$Res>
    implements $DeckBuilderPreBuiltCopyWith<$Res> {
  _$DeckBuilderPreBuiltCopyWithImpl(
      DeckBuilderPreBuilt _value, $Res Function(DeckBuilderPreBuilt) _then)
      : super(_value, (v) => _then(v as DeckBuilderPreBuilt));

  @override
  DeckBuilderPreBuilt get _value => super._value as DeckBuilderPreBuilt;

  @override
  $Res call({
    Object? sections = freezed,
  }) {
    return _then(DeckBuilderPreBuilt(
      sections == freezed
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as Iterable<DeckBuilderSection>,
    ));
  }
}

/// @nodoc

class _$DeckBuilderPreBuilt implements DeckBuilderPreBuilt {
  const _$DeckBuilderPreBuilt(this.sections);

  @override
  final Iterable<DeckBuilderSection> sections;

  @override
  String toString() {
    return 'DeckBuilderState.preBuilt(sections: $sections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckBuilderPreBuilt &&
            (identical(other.sections, sections) ||
                const DeepCollectionEquality()
                    .equals(other.sections, sections)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sections);

  @JsonKey(ignore: true)
  @override
  $DeckBuilderPreBuiltCopyWith<DeckBuilderPreBuilt> get copyWith =>
      _$DeckBuilderPreBuiltCopyWithImpl<DeckBuilderPreBuilt>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return preBuilt(sections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
    TResult Function()? loading,
    TResult Function()? noData,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (preBuilt != null) {
      return preBuilt(sections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return preBuilt(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
    TResult Function(DeckBuilderLoading value)? loading,
    TResult Function(DeckBuilderNoData value)? noData,
    TResult Function(DeckBuilderError value)? error,
    required TResult orElse(),
  }) {
    if (preBuilt != null) {
      return preBuilt(this);
    }
    return orElse();
  }
}

abstract class DeckBuilderPreBuilt implements DeckBuilderState {
  const factory DeckBuilderPreBuilt(Iterable<DeckBuilderSection> sections) =
      _$DeckBuilderPreBuilt;

  Iterable<DeckBuilderSection> get sections =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckBuilderPreBuiltCopyWith<DeckBuilderPreBuilt> get copyWith =>
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
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
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
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
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
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
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
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
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
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<YugiohCard> cards) filtered,
    required TResult Function(Iterable<DeckBuilderSection> sections) preBuilt,
    required TResult Function() loading,
    required TResult Function() noData,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<YugiohCard> cards)? filtered,
    TResult Function(Iterable<DeckBuilderSection> sections)? preBuilt,
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
  TResult map<TResult extends Object?>({
    required TResult Function(DeckBuilderFiltered value) filtered,
    required TResult Function(DeckBuilderPreBuilt value) preBuilt,
    required TResult Function(DeckBuilderLoading value) loading,
    required TResult Function(DeckBuilderNoData value) noData,
    required TResult Function(DeckBuilderError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckBuilderFiltered value)? filtered,
    TResult Function(DeckBuilderPreBuilt value)? preBuilt,
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
