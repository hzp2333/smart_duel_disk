import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core_smart_duel_server_interface.dart';

@immutable
class SmartDuelEvent extends Equatable {
  final String scope;
  final String action;
  final SmartDuelEventData data;

  const SmartDuelEvent._({
    @required this.scope,
    @required this.action,
    @required this.data,
  });

  factory SmartDuelEvent.playCard(CardEventData data) {
    return SmartDuelEvent._(
      scope: 'card',
      action: 'play',
      data: data,
    );
  }

  factory SmartDuelEvent.removeCard(CardEventData data) {
    return SmartDuelEvent._(
      scope: 'card',
      action: 'remove',
      data: data,
    );
  }

  @override
  List<Object> get props => [
        scope,
        action,
        data,
      ];
}
