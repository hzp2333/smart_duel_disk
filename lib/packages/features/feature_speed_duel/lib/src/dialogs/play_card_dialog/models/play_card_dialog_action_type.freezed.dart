// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'play_card_dialog_action_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PlayCardDialogActionTypeTearOff {
  const _$PlayCardDialogActionTypeTearOff();

// ignore: unused_element
  PlayCardDialogSummonAction summon() {
    return const PlayCardDialogSummonAction();
  }

// ignore: unused_element
  PlayCardDialogActivateAction activate() {
    return const PlayCardDialogActivateAction();
  }

// ignore: unused_element
  PlayCardDialogToAttackAction toAttack(PlayCard playCard) {
    return PlayCardDialogToAttackAction(
      playCard,
    );
  }

// ignore: unused_element
  PlayCardDialogToDefenseAction toDefense(PlayCard playCard) {
    return PlayCardDialogToDefenseAction(
      playCard,
    );
  }

// ignore: unused_element
  PlayCardDialogSetAction set(PlayCard playCard, {Zone newZone}) {
    return PlayCardDialogSetAction(
      playCard,
      newZone: newZone,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PlayCardDialogActionType = _$PlayCardDialogActionTypeTearOff();

/// @nodoc
mixin _$PlayCardDialogActionType {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PlayCardDialogActionTypeCopyWith<$Res> {
  factory $PlayCardDialogActionTypeCopyWith(PlayCardDialogActionType value,
          $Res Function(PlayCardDialogActionType) then) =
      _$PlayCardDialogActionTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogActionTypeCopyWith<$Res> {
  _$PlayCardDialogActionTypeCopyWithImpl(this._value, this._then);

  final PlayCardDialogActionType _value;
  // ignore: unused_field
  final $Res Function(PlayCardDialogActionType) _then;
}

/// @nodoc
abstract class $PlayCardDialogSummonActionCopyWith<$Res> {
  factory $PlayCardDialogSummonActionCopyWith(PlayCardDialogSummonAction value,
          $Res Function(PlayCardDialogSummonAction) then) =
      _$PlayCardDialogSummonActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayCardDialogSummonActionCopyWithImpl<$Res>
    extends _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogSummonActionCopyWith<$Res> {
  _$PlayCardDialogSummonActionCopyWithImpl(PlayCardDialogSummonAction _value,
      $Res Function(PlayCardDialogSummonAction) _then)
      : super(_value, (v) => _then(v as PlayCardDialogSummonAction));

  @override
  PlayCardDialogSummonAction get _value =>
      super._value as PlayCardDialogSummonAction;
}

/// @nodoc
class _$PlayCardDialogSummonAction implements PlayCardDialogSummonAction {
  const _$PlayCardDialogSummonAction();

  @override
  String toString() {
    return 'PlayCardDialogActionType.summon()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PlayCardDialogSummonAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return summon();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (summon != null) {
      return summon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return summon(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (summon != null) {
      return summon(this);
    }
    return orElse();
  }
}

abstract class PlayCardDialogSummonAction implements PlayCardDialogActionType {
  const factory PlayCardDialogSummonAction() = _$PlayCardDialogSummonAction;
}

/// @nodoc
abstract class $PlayCardDialogActivateActionCopyWith<$Res> {
  factory $PlayCardDialogActivateActionCopyWith(
          PlayCardDialogActivateAction value,
          $Res Function(PlayCardDialogActivateAction) then) =
      _$PlayCardDialogActivateActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayCardDialogActivateActionCopyWithImpl<$Res>
    extends _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogActivateActionCopyWith<$Res> {
  _$PlayCardDialogActivateActionCopyWithImpl(
      PlayCardDialogActivateAction _value,
      $Res Function(PlayCardDialogActivateAction) _then)
      : super(_value, (v) => _then(v as PlayCardDialogActivateAction));

  @override
  PlayCardDialogActivateAction get _value =>
      super._value as PlayCardDialogActivateAction;
}

/// @nodoc
class _$PlayCardDialogActivateAction implements PlayCardDialogActivateAction {
  const _$PlayCardDialogActivateAction();

  @override
  String toString() {
    return 'PlayCardDialogActionType.activate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PlayCardDialogActivateAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return activate();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (activate != null) {
      return activate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return activate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (activate != null) {
      return activate(this);
    }
    return orElse();
  }
}

abstract class PlayCardDialogActivateAction
    implements PlayCardDialogActionType {
  const factory PlayCardDialogActivateAction() = _$PlayCardDialogActivateAction;
}

/// @nodoc
abstract class $PlayCardDialogToAttackActionCopyWith<$Res> {
  factory $PlayCardDialogToAttackActionCopyWith(
          PlayCardDialogToAttackAction value,
          $Res Function(PlayCardDialogToAttackAction) then) =
      _$PlayCardDialogToAttackActionCopyWithImpl<$Res>;
  $Res call({PlayCard playCard});
}

/// @nodoc
class _$PlayCardDialogToAttackActionCopyWithImpl<$Res>
    extends _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogToAttackActionCopyWith<$Res> {
  _$PlayCardDialogToAttackActionCopyWithImpl(
      PlayCardDialogToAttackAction _value,
      $Res Function(PlayCardDialogToAttackAction) _then)
      : super(_value, (v) => _then(v as PlayCardDialogToAttackAction));

  @override
  PlayCardDialogToAttackAction get _value =>
      super._value as PlayCardDialogToAttackAction;

  @override
  $Res call({
    Object playCard = freezed,
  }) {
    return _then(PlayCardDialogToAttackAction(
      playCard == freezed ? _value.playCard : playCard as PlayCard,
    ));
  }
}

/// @nodoc
class _$PlayCardDialogToAttackAction implements PlayCardDialogToAttackAction {
  const _$PlayCardDialogToAttackAction(this.playCard)
      : assert(playCard != null);

  @override
  final PlayCard playCard;

  @override
  String toString() {
    return 'PlayCardDialogActionType.toAttack(playCard: $playCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlayCardDialogToAttackAction &&
            (identical(other.playCard, playCard) ||
                const DeepCollectionEquality()
                    .equals(other.playCard, playCard)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(playCard);

  @override
  $PlayCardDialogToAttackActionCopyWith<PlayCardDialogToAttackAction>
      get copyWith => _$PlayCardDialogToAttackActionCopyWithImpl<
          PlayCardDialogToAttackAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return toAttack(playCard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (toAttack != null) {
      return toAttack(playCard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return toAttack(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (toAttack != null) {
      return toAttack(this);
    }
    return orElse();
  }
}

abstract class PlayCardDialogToAttackAction
    implements PlayCardDialogActionType {
  const factory PlayCardDialogToAttackAction(PlayCard playCard) =
      _$PlayCardDialogToAttackAction;

  PlayCard get playCard;
  $PlayCardDialogToAttackActionCopyWith<PlayCardDialogToAttackAction>
      get copyWith;
}

/// @nodoc
abstract class $PlayCardDialogToDefenseActionCopyWith<$Res> {
  factory $PlayCardDialogToDefenseActionCopyWith(
          PlayCardDialogToDefenseAction value,
          $Res Function(PlayCardDialogToDefenseAction) then) =
      _$PlayCardDialogToDefenseActionCopyWithImpl<$Res>;
  $Res call({PlayCard playCard});
}

/// @nodoc
class _$PlayCardDialogToDefenseActionCopyWithImpl<$Res>
    extends _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogToDefenseActionCopyWith<$Res> {
  _$PlayCardDialogToDefenseActionCopyWithImpl(
      PlayCardDialogToDefenseAction _value,
      $Res Function(PlayCardDialogToDefenseAction) _then)
      : super(_value, (v) => _then(v as PlayCardDialogToDefenseAction));

  @override
  PlayCardDialogToDefenseAction get _value =>
      super._value as PlayCardDialogToDefenseAction;

  @override
  $Res call({
    Object playCard = freezed,
  }) {
    return _then(PlayCardDialogToDefenseAction(
      playCard == freezed ? _value.playCard : playCard as PlayCard,
    ));
  }
}

/// @nodoc
class _$PlayCardDialogToDefenseAction implements PlayCardDialogToDefenseAction {
  const _$PlayCardDialogToDefenseAction(this.playCard)
      : assert(playCard != null);

  @override
  final PlayCard playCard;

  @override
  String toString() {
    return 'PlayCardDialogActionType.toDefense(playCard: $playCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlayCardDialogToDefenseAction &&
            (identical(other.playCard, playCard) ||
                const DeepCollectionEquality()
                    .equals(other.playCard, playCard)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(playCard);

  @override
  $PlayCardDialogToDefenseActionCopyWith<PlayCardDialogToDefenseAction>
      get copyWith => _$PlayCardDialogToDefenseActionCopyWithImpl<
          PlayCardDialogToDefenseAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return toDefense(playCard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (toDefense != null) {
      return toDefense(playCard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return toDefense(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (toDefense != null) {
      return toDefense(this);
    }
    return orElse();
  }
}

abstract class PlayCardDialogToDefenseAction
    implements PlayCardDialogActionType {
  const factory PlayCardDialogToDefenseAction(PlayCard playCard) =
      _$PlayCardDialogToDefenseAction;

  PlayCard get playCard;
  $PlayCardDialogToDefenseActionCopyWith<PlayCardDialogToDefenseAction>
      get copyWith;
}

/// @nodoc
abstract class $PlayCardDialogSetActionCopyWith<$Res> {
  factory $PlayCardDialogSetActionCopyWith(PlayCardDialogSetAction value,
          $Res Function(PlayCardDialogSetAction) then) =
      _$PlayCardDialogSetActionCopyWithImpl<$Res>;
  $Res call({PlayCard playCard, Zone newZone});
}

/// @nodoc
class _$PlayCardDialogSetActionCopyWithImpl<$Res>
    extends _$PlayCardDialogActionTypeCopyWithImpl<$Res>
    implements $PlayCardDialogSetActionCopyWith<$Res> {
  _$PlayCardDialogSetActionCopyWithImpl(PlayCardDialogSetAction _value,
      $Res Function(PlayCardDialogSetAction) _then)
      : super(_value, (v) => _then(v as PlayCardDialogSetAction));

  @override
  PlayCardDialogSetAction get _value => super._value as PlayCardDialogSetAction;

  @override
  $Res call({
    Object playCard = freezed,
    Object newZone = freezed,
  }) {
    return _then(PlayCardDialogSetAction(
      playCard == freezed ? _value.playCard : playCard as PlayCard,
      newZone: newZone == freezed ? _value.newZone : newZone as Zone,
    ));
  }
}

/// @nodoc
class _$PlayCardDialogSetAction implements PlayCardDialogSetAction {
  const _$PlayCardDialogSetAction(this.playCard, {this.newZone})
      : assert(playCard != null);

  @override
  final PlayCard playCard;
  @override
  final Zone newZone;

  @override
  String toString() {
    return 'PlayCardDialogActionType.set(playCard: $playCard, newZone: $newZone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlayCardDialogSetAction &&
            (identical(other.playCard, playCard) ||
                const DeepCollectionEquality()
                    .equals(other.playCard, playCard)) &&
            (identical(other.newZone, newZone) ||
                const DeepCollectionEquality().equals(other.newZone, newZone)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(playCard) ^
      const DeepCollectionEquality().hash(newZone);

  @override
  $PlayCardDialogSetActionCopyWith<PlayCardDialogSetAction> get copyWith =>
      _$PlayCardDialogSetActionCopyWithImpl<PlayCardDialogSetAction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult summon(),
    @required TResult activate(),
    @required TResult toAttack(PlayCard playCard),
    @required TResult toDefense(PlayCard playCard),
    @required TResult set(PlayCard playCard, Zone newZone),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return set(playCard, newZone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult summon(),
    TResult activate(),
    TResult toAttack(PlayCard playCard),
    TResult toDefense(PlayCard playCard),
    TResult set(PlayCard playCard, Zone newZone),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (set != null) {
      return set(playCard, newZone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult summon(PlayCardDialogSummonAction value),
    @required TResult activate(PlayCardDialogActivateAction value),
    @required TResult toAttack(PlayCardDialogToAttackAction value),
    @required TResult toDefense(PlayCardDialogToDefenseAction value),
    @required TResult set(PlayCardDialogSetAction value),
  }) {
    assert(summon != null);
    assert(activate != null);
    assert(toAttack != null);
    assert(toDefense != null);
    assert(set != null);
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult summon(PlayCardDialogSummonAction value),
    TResult activate(PlayCardDialogActivateAction value),
    TResult toAttack(PlayCardDialogToAttackAction value),
    TResult toDefense(PlayCardDialogToDefenseAction value),
    TResult set(PlayCardDialogSetAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class PlayCardDialogSetAction implements PlayCardDialogActionType {
  const factory PlayCardDialogSetAction(PlayCard playCard, {Zone newZone}) =
      _$PlayCardDialogSetAction;

  PlayCard get playCard;
  Zone get newZone;
  $PlayCardDialogSetActionCopyWith<PlayCardDialogSetAction> get copyWith;
}
