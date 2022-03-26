// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deck_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeckListStateTearOff {
  const _$DeckListStateTearOff();

  DeckListData data(
      {required Iterable<Deck> decks,
      required Iterable<YugiohCard> skillCards}) {
    return DeckListData(
      decks: decks,
      skillCards: skillCards,
    );
  }

  DeckListLoading loading() {
    return const DeckListLoading();
  }
}

/// @nodoc
const $DeckListState = _$DeckListStateTearOff();

/// @nodoc
mixin _$DeckListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<Deck> decks, Iterable<YugiohCard> skillCards)
        data,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeckListData value) data,
    required TResult Function(DeckListLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckListStateCopyWith<$Res> {
  factory $DeckListStateCopyWith(
          DeckListState value, $Res Function(DeckListState) then) =
      _$DeckListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckListStateCopyWithImpl<$Res>
    implements $DeckListStateCopyWith<$Res> {
  _$DeckListStateCopyWithImpl(this._value, this._then);

  final DeckListState _value;
  // ignore: unused_field
  final $Res Function(DeckListState) _then;
}

/// @nodoc
abstract class $DeckListDataCopyWith<$Res> {
  factory $DeckListDataCopyWith(
          DeckListData value, $Res Function(DeckListData) then) =
      _$DeckListDataCopyWithImpl<$Res>;
  $Res call({Iterable<Deck> decks, Iterable<YugiohCard> skillCards});
}

/// @nodoc
class _$DeckListDataCopyWithImpl<$Res> extends _$DeckListStateCopyWithImpl<$Res>
    implements $DeckListDataCopyWith<$Res> {
  _$DeckListDataCopyWithImpl(
      DeckListData _value, $Res Function(DeckListData) _then)
      : super(_value, (v) => _then(v as DeckListData));

  @override
  DeckListData get _value => super._value as DeckListData;

  @override
  $Res call({
    Object? decks = freezed,
    Object? skillCards = freezed,
  }) {
    return _then(DeckListData(
      decks: decks == freezed
          ? _value.decks
          : decks // ignore: cast_nullable_to_non_nullable
              as Iterable<Deck>,
      skillCards: skillCards == freezed
          ? _value.skillCards
          : skillCards // ignore: cast_nullable_to_non_nullable
              as Iterable<YugiohCard>,
    ));
  }
}

/// @nodoc

class _$DeckListData implements DeckListData {
  const _$DeckListData({required this.decks, required this.skillCards});

  @override
  final Iterable<Deck> decks;
  @override
  final Iterable<YugiohCard> skillCards;

  @override
  String toString() {
    return 'DeckListState.data(decks: $decks, skillCards: $skillCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeckListData &&
            (identical(other.decks, decks) ||
                const DeepCollectionEquality().equals(other.decks, decks)) &&
            (identical(other.skillCards, skillCards) ||
                const DeepCollectionEquality()
                    .equals(other.skillCards, skillCards)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(decks) ^
      const DeepCollectionEquality().hash(skillCards);

  @JsonKey(ignore: true)
  @override
  $DeckListDataCopyWith<DeckListData> get copyWith =>
      _$DeckListDataCopyWithImpl<DeckListData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<Deck> decks, Iterable<YugiohCard> skillCards)
        data,
    required TResult Function() loading,
  }) {
    return data(decks, skillCards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
  }) {
    return data?.call(decks, skillCards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(decks, skillCards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeckListData value) data,
    required TResult Function(DeckListLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DeckListData implements DeckListState {
  const factory DeckListData(
      {required Iterable<Deck> decks,
      required Iterable<YugiohCard> skillCards}) = _$DeckListData;

  Iterable<Deck> get decks => throw _privateConstructorUsedError;
  Iterable<YugiohCard> get skillCards => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckListDataCopyWith<DeckListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckListLoadingCopyWith<$Res> {
  factory $DeckListLoadingCopyWith(
          DeckListLoading value, $Res Function(DeckListLoading) then) =
      _$DeckListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeckListLoadingCopyWithImpl<$Res>
    extends _$DeckListStateCopyWithImpl<$Res>
    implements $DeckListLoadingCopyWith<$Res> {
  _$DeckListLoadingCopyWithImpl(
      DeckListLoading _value, $Res Function(DeckListLoading) _then)
      : super(_value, (v) => _then(v as DeckListLoading));

  @override
  DeckListLoading get _value => super._value as DeckListLoading;
}

/// @nodoc

class _$DeckListLoading implements DeckListLoading {
  const _$DeckListLoading();

  @override
  String toString() {
    return 'DeckListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeckListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<Deck> decks, Iterable<YugiohCard> skillCards)
        data,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Deck> decks, Iterable<YugiohCard> skillCards)?
        data,
    TResult Function()? loading,
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
    required TResult Function(DeckListData value) data,
    required TResult Function(DeckListLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeckListData value)? data,
    TResult Function(DeckListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeckListLoading implements DeckListState {
  const factory DeckListLoading() = _$DeckListLoading;
}
