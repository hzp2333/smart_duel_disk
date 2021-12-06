import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';

import 'player_state.dart';

@immutable
class SpeedDuelState extends Equatable {
  final PlayerState userState;
  final PlayerState opponentState;
  final DuelPhase duelPhase;
  final int turn;

  const SpeedDuelState({
    required this.userState,
    required this.opponentState,
    required this.duelPhase,
    required this.turn,
  });

  SpeedDuelState copyWith({PlayerState? userState, PlayerState? opponentState, DuelPhase? duelPhase, int? turn}) {
    return SpeedDuelState(
      userState: userState ?? this.userState,
      opponentState: opponentState ?? this.opponentState,
      duelPhase: duelPhase ?? this.duelPhase,
      turn: turn ?? this.turn,
    );
  }

  Iterable<PlayerState> getPlayerStates() {
    return [
      userState,
      opponentState,
    ];
  }

  bool get isUsersTurn => userState.duelistId == duelPhase.duelistId;

  @override
  List<Object?> get props => [
        userState,
        opponentState,
        duelPhase,
        turn,
      ];

  @override
  bool get stringify => true;
}
