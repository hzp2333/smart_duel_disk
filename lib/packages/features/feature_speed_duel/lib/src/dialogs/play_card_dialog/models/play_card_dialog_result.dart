import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_result.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

abstract class PlayCardDialogResult extends SpeedDuelDialogResult {
  const PlayCardDialogResult() : super();
}

class PlayCardUpdatePosition extends PlayCardDialogResult {
  final CardPosition position;

  const PlayCardUpdatePosition({
    required this.position,
  }) : super();

  @override
  List<Object?> get props => [position];
}

class PlayCardDeclare extends PlayCardDialogResult {
  const PlayCardDeclare() : super();
}
