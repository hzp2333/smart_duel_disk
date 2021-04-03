import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core_smart_duel_server_interface.dart';

@immutable
class SpeedDuelEvent extends Equatable {
  final String scope;
  final String action;
  final SpeedDuelEventData data;

  const SpeedDuelEvent._({
    @required this.scope,
    @required this.action,
    @required this.data,
  });

  factory SpeedDuelEvent.playCard(CardEventData data) {
    return SpeedDuelEvent._(
      scope: 'card',
      action: 'play',
      data: data,
    );
  }

  factory SpeedDuelEvent.removeCard(CardEventData data) {
    return SpeedDuelEvent._(
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
