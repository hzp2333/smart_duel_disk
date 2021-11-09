import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';

import 'models/play_card_dialog_action.dart';
import 'models/play_card_dialog_parameters.dart';

@Injectable()
class PlayCardDialogViewModel extends BaseViewModel {
  static const _tag = 'PlayCardDialogViewModel';

  final PlayCardDialogParameters? _parameters;
  final CreatePlayCardDialogActionsUseCase _createPlayCardDialogActionsUseCase;
  final DialogService _dialogService;

  PlayCard get playCard => _parameters!.playCard!;

  Iterable<PlayCardDialogAction>? _cardActions = [];
  Iterable<PlayCardDialogAction>? get cardActions => _cardActions;

  PlayCardDialogViewModel(
    @factoryParam this._parameters,
    this._createPlayCardDialogActionsUseCase,
    this._dialogService,
    Logger logger,
  ) : super(logger) {
    _init();
  }

  void _init() {
    logger.verbose(_tag, '_init()');

    if (!_parameters!.showActions) {
      return;
    }

    _cardActions = _createPlayCardDialogActionsUseCase(
      _parameters!.playCard!,
      _parameters!.newZone,
    );
  }

  void onPlayCardDialogActionPressed(PlayCardDialogAction action) {
    logger.info(_tag, 'onPlayCardDialogActionPressed(action: $action)');

    _dialogService.popDialog(action.result);
  }
}
