import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory SmartDuelEvent.playCard(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardPlayAction,
      data: data,
    );
  }

  factory SmartDuelEvent.removeCard(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardRemoveAction,
      data: data,
    );
  }

  factory SmartDuelEvent.attackCard(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.cardScope,
      action: SmartDuelEventConstants.cardAttackAction,
      data: data,
    );
  }

  factory SmartDuelEvent.createRoom([SmartDuelEventData? data]) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomCreateAction,
      data: data,
    );
  }

  factory SmartDuelEvent.closeRoom(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomCloseAction,
      data: data,
    );
  }

  factory SmartDuelEvent.joinRoom(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomJoinAction,
      data: data,
    );
  }

  factory SmartDuelEvent.startRoom(SmartDuelEventData? data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomStartAction,
      data: data,
    );
  }

  factory SmartDuelEvent.surrenderRoom(SmartDuelEventData data) {
    return SmartDuelEvent._(
      scope: SmartDuelEventConstants.roomScope,
      action: SmartDuelEventConstants.roomSurrenderAction,
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
