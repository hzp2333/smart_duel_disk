import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_result.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

abstract class PlayCardDialogResult extends SpeedDuelDialogResult {
  const PlayCardDialogResult() : super();
}

class PlayCardUpdatePosition extends PlayCardDialogResult {
  final CardPosition position;
  final CardPlayType? playType;

  const PlayCardUpdatePosition({
    required this.position,
    this.playType,
  }) : super();

  @override
  List<Object?> get props => [
        ...super.props,
        position,
        playType,
      ];
}

class PlayCardDeclare extends PlayCardDialogResult {
  const PlayCardDeclare() : super();
}

class PlayCardAddCounter extends PlayCardDialogResult {
  const PlayCardAddCounter() : super();
}

class PlayCardRemoveCounter extends PlayCardDialogResult {
  const PlayCardRemoveCounter() : super();
}

class PlayCardReveal extends PlayCardDialogResult {
  const PlayCardReveal() : super();
}

class PlayCardHide extends PlayCardDialogResult {
  const PlayCardHide() : super();
}

class PlayCardGiveToOpponent extends PlayCardDialogResult {
  const PlayCardGiveToOpponent() : super();
}
