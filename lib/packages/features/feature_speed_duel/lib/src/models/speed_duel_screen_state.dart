import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';

part 'speed_duel_screen_state.freezed.dart';

@freezed
abstract class SpeedDuelScreenState with _$SpeedDuelScreenState {
  const factory SpeedDuelScreenState(SpeedDuelState state) = SpeedDuelData;
  const factory SpeedDuelScreenState.loading() = SpeedDuelLoading;
  const factory SpeedDuelScreenState.error() = SpeedDuelError;
}
