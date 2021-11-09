// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'play_card_dialog_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayCardDialogResultTearOff {
  const _$PlayCardDialogResultTearOff();

  PlayCardUpdatePosition updatePosition(CardPosition position) {
    return PlayCardUpdatePosition(
      position,
    );
  }

  PlayCardDeclare declare() {
    return const PlayCardDeclare();
  }
}

/// @nodoc
const $PlayCardDialogResult = _$PlayCardDialogResultTearOff();

/// @nodoc
mixin _$PlayCardDialogResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardPosition position) updatePosition,
    required TResult Function() declare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayCardUpdatePosition value) updatePosition,
    required TResult Function(PlayCardDeclare value) declare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayCardDialogResultCopyWith<$Res> {
  factory $PlayCardDialogResultCopyWith(PlayCardDialogResult value,
          $Res Function(PlayCardDialogResult) then) =
      _$PlayCardDialogResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayCardDialogResultCopyWithImpl<$Res>
    implements $PlayCardDialogResultCopyWith<$Res> {
  _$PlayCardDialogResultCopyWithImpl(this._value, this._then);

  final PlayCardDialogResult _value;
  // ignore: unused_field
  final $Res Function(PlayCardDialogResult) _then;
}

/// @nodoc
abstract class $PlayCardUpdatePositionCopyWith<$Res> {
  factory $PlayCardUpdatePositionCopyWith(PlayCardUpdatePosition value,
          $Res Function(PlayCardUpdatePosition) then) =
      _$PlayCardUpdatePositionCopyWithImpl<$Res>;
  $Res call({CardPosition position});
}

/// @nodoc
class _$PlayCardUpdatePositionCopyWithImpl<$Res>
    extends _$PlayCardDialogResultCopyWithImpl<$Res>
    implements $PlayCardUpdatePositionCopyWith<$Res> {
  _$PlayCardUpdatePositionCopyWithImpl(PlayCardUpdatePosition _value,
      $Res Function(PlayCardUpdatePosition) _then)
      : super(_value, (v) => _then(v as PlayCardUpdatePosition));

  @override
  PlayCardUpdatePosition get _value => super._value as PlayCardUpdatePosition;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(PlayCardUpdatePosition(
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as CardPosition,
    ));
  }
}

/// @nodoc

class _$PlayCardUpdatePosition implements PlayCardUpdatePosition {
  const _$PlayCardUpdatePosition(this.position);

  @override
  final CardPosition position;

  @override
  String toString() {
    return 'PlayCardDialogResult.updatePosition(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlayCardUpdatePosition &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(position);

  @JsonKey(ignore: true)
  @override
  $PlayCardUpdatePositionCopyWith<PlayCardUpdatePosition> get copyWith =>
      _$PlayCardUpdatePositionCopyWithImpl<PlayCardUpdatePosition>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardPosition position) updatePosition,
    required TResult Function() declare,
  }) {
    return updatePosition(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
  }) {
    return updatePosition?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayCardUpdatePosition value) updatePosition,
    required TResult Function(PlayCardDeclare value) declare,
  }) {
    return updatePosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
  }) {
    return updatePosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
    required TResult orElse(),
  }) {
    if (updatePosition != null) {
      return updatePosition(this);
    }
    return orElse();
  }
}

abstract class PlayCardUpdatePosition implements PlayCardDialogResult {
  const factory PlayCardUpdatePosition(CardPosition position) =
      _$PlayCardUpdatePosition;

  CardPosition get position => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayCardUpdatePositionCopyWith<PlayCardUpdatePosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayCardDeclareCopyWith<$Res> {
  factory $PlayCardDeclareCopyWith(
          PlayCardDeclare value, $Res Function(PlayCardDeclare) then) =
      _$PlayCardDeclareCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayCardDeclareCopyWithImpl<$Res>
    extends _$PlayCardDialogResultCopyWithImpl<$Res>
    implements $PlayCardDeclareCopyWith<$Res> {
  _$PlayCardDeclareCopyWithImpl(
      PlayCardDeclare _value, $Res Function(PlayCardDeclare) _then)
      : super(_value, (v) => _then(v as PlayCardDeclare));

  @override
  PlayCardDeclare get _value => super._value as PlayCardDeclare;
}

/// @nodoc

class _$PlayCardDeclare implements PlayCardDeclare {
  const _$PlayCardDeclare();

  @override
  String toString() {
    return 'PlayCardDialogResult.declare()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PlayCardDeclare);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CardPosition position) updatePosition,
    required TResult Function() declare,
  }) {
    return declare();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
  }) {
    return declare?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CardPosition position)? updatePosition,
    TResult Function()? declare,
    required TResult orElse(),
  }) {
    if (declare != null) {
      return declare();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayCardUpdatePosition value) updatePosition,
    required TResult Function(PlayCardDeclare value) declare,
  }) {
    return declare(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
  }) {
    return declare?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayCardUpdatePosition value)? updatePosition,
    TResult Function(PlayCardDeclare value)? declare,
    required TResult orElse(),
  }) {
    if (declare != null) {
      return declare(this);
    }
    return orElse();
  }
}

abstract class PlayCardDeclare implements PlayCardDialogResult {
  const factory PlayCardDeclare() = _$PlayCardDeclare;
}
