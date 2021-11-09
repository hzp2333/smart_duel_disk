import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

part 'play_card_dialog_result.freezed.dart';

@freezed
abstract class PlayCardDialogResult with _$PlayCardDialogResult {
  const factory PlayCardDialogResult.updatePosition(CardPosition position) = PlayCardUpdatePosition;
  const factory PlayCardDialogResult.declare() = PlayCardDeclare;
}
