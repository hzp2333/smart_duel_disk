import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';

part 'speed_duel_state.freezed.dart';

@freezed
abstract class SpeedDuelState with _$SpeedDuelState {
  const factory SpeedDuelState(PlayerState playerState) = SpeedDuelData;
  const factory SpeedDuelState.loading() = SpeedDuelLoading;
  const factory SpeedDuelState.error() = SpeedDuelError;
}
