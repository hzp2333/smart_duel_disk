import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/speed_duel_dialog_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

import 'models/add_card_to_deck_dialog_action.dart';

class AddCardToDeckDialogViewModel extends SpeedDuelDialogViewModel<AddCardToDeckDialogAction> {
  static const _tag = 'AddCardToDeckDialogViewModel';

  final PlayCard _playCard;

  PlayCard get playCard => _playCard;

  AddCardToDeckDialogViewModel(
    this._playCard,
    DialogService dialogService,
    Logger logger,
  ) : super(
          dialogService,
          logger,
        );

  @override
  PlayCard getPlayCard() => _playCard;

  @override
  Iterable<AddCardToDeckDialogAction> getDialogActions() {
    logger.info(_tag, 'getDialogActions()');

    return const [
      AddAndShuffleAction(),
      AddToTopDialogAction(),
      AddToBottomDialogAction(),
    ];
  }

  @override
  void onDialogActionPressed(AddCardToDeckDialogAction action) {
    logger.info(_tag, 'onDialogActionPressed(action: $action)');

    dialogService.popDialog(action.result);
  }
}
