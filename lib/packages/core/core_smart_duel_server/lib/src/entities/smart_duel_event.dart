import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

import 'event_data/smart_duel_event_data.dart';
import 'smart_duel_event_constants.dart';

@immutable
class SmartDuelEvent extends Equatable {
  final String scope;
  final String action;
  final SmartDuelEventData? data;

  const SmartDuelEvent._({
    required this.scope,
    required this.action,
    this.data,
  });

  factory SmartDuelEvent.global(String status) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.globalScope,
      action: status,
    );
  }

  factory SmartDuelEvent.playCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardPlayAction,
      data: data,
    );
  }

  factory SmartDuelEvent.removeCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardRemoveAction,
      data: data,
    );
  }

  factory SmartDuelEvent.attackCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardAttackAction,
      data: data,
    );
  }

  factory SmartDuelEvent.declareCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardDeclareAction,
      data: data,
    );
  }

  factory SmartDuelEvent.addCounterToCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardAddCounterAction,
      data: data,
    );
  }

  factory SmartDuelEvent.removeCounterFromCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardRemoveCounterAction,
      data: data,
    );
  }

  factory SmartDuelEvent.revealCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardRevealAction,
      data: data,
    );
  }

  factory SmartDuelEvent.hideCard(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardHideAction,
      data: data,
    );
  }

  factory SmartDuelEvent.giveCardToOpponent(CardEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardGiveToOpponentAction,
      data: data,
    );
  }

  factory SmartDuelEvent.createRoom([RoomEventData? data]) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomCreateAction,
      data: data,
    );
  }

  factory SmartDuelEvent.closeRoom(RoomEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomCloseAction,
      data: data,
    );
  }

  factory SmartDuelEvent.joinRoom(RoomEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomJoinAction,
      data: data,
    );
  }

  factory SmartDuelEvent.startRoom(RoomEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomStartAction,
      data: data,
    );
  }

  factory SmartDuelEvent.surrenderRoom(RoomEventData data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomSurrenderAction,
      data: data,
    );
  }

  factory SmartDuelEvent.shuffleDeck(DeckEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.deckScope,
      action: SmartDuelEventConstants.deckShuffleAction,
      data: data,
    );
  }

  factory SmartDuelEvent.rollDice(DuelistEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.duelistScope,
      action: SmartDuelEventConstants.duelistRollDiceAction,
      data: data,
    );
  }

  factory SmartDuelEvent.flipCoin(DuelistEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.duelistScope,
      action: SmartDuelEventConstants.duelistFlipCoinAction,
      data: data,
    );
  }

  factory SmartDuelEvent.declarePhase(DuelistEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.duelistScope,
      action: SmartDuelEventConstants.duelistDeclarePhaseAction,
      data: data,
    );
  }

  factory SmartDuelEvent.endTurn(DuelistEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.duelistScope,
      action: SmartDuelEventConstants.duelistEndTurnAction,
      data: data,
    );
  }

  factory SmartDuelEvent.updateLifepoints(DuelistEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.duelistScope,
      action: SmartDuelEventConstants.duelistUpdateLifepointsAction,
      data: data,
    );
  }

  @override
  List<Object?> get props => [
        scope,
        action,
        data,
      ];

  @override
  bool get stringify => true;
}
