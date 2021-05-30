import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';

@immutable
class SpeedDuelState extends Equatable {
  final PlayerState userState;
  final PlayerState opponentState;

  const SpeedDuelState({
    @required this.userState,
    @required this.opponentState,
  });

  SpeedDuelState copyWith({PlayerState userState, PlayerState opponentState}) {
    return SpeedDuelState(
      userState: userState ?? this.userState,
      opponentState: opponentState ?? this.opponentState,
    );
  }

  @override
  List<Object> get props => [
        userState,
        opponentState,
      ];

  @override
  bool get stringify => true;
}
