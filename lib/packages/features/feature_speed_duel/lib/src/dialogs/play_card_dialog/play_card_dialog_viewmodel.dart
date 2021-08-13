import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

import 'models/play_card_dialog_action.dart';
import 'models/play_card_dialog_parameters.dart';

@Injectable()
class PlayCardDialogViewModel extends BaseViewModel {
  static const _tag = 'PlayCardDialogViewModel';

  final PlayCardDialogParameters _parameters;
  final CreatePlayCardDialogActionsUseCase _createPlayCardDialogActionsUseCase;
  final DialogService _dialogService;

  PlayCard get playCard => _parameters?.playCard;

  Iterable<PlayCardDialogAction> _cardActions = [];
  Iterable<PlayCardDialogAction> get cardActions => _cardActions;

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

    if (!_parameters.showActions) {
      return;
    }

    _cardActions = _createPlayCardDialogActionsUseCase(
      _parameters?.playCard,
      _parameters?.newZone,
    );
  }

  void onPlayCardDialogActionPressed(PlayCardDialogActionType actionType) {
    logger.info(_tag, 'onPlayCardDialogActionPressed(actionType: $actionType)');

    actionType.when(
      summon: _onSummonPressed,
      activate: _onActivatePressed,
      toAttack: _onChangeToAttackPressed,
      summonAttack: _onChangeToAttackPressed,
      toDefence: _onChangeToDefencePressed,
      summonDefence: _onChangeToDefencePressed,
      flip: _onFlipPressed,
      destroy: _onDestroyPressed,
      set: _onSetPressed,
    );
  }

  void _onSummonPressed() {
    logger.verbose(_tag, '_onSummonPressed()');

    _dialogService.popDialog(CardPosition.faceUp);
  }

  void _onChangeToAttackPressed() {
    logger.verbose(_tag, '_onChangeToAttackPressed()');

    _dialogService.popDialog(CardPosition.faceUp);
  }

  void _onChangeToDefencePressed() {
    logger.verbose(_tag, '_onChangeToDefencePressed()');

    _dialogService.popDialog(CardPosition.faceUpDefence);
  }

  void _onActivatePressed() {
    logger.verbose(_tag, '_onActivatePressed()');

    _dialogService.popDialog(CardPosition.faceUp);
  }

  void _onFlipPressed() {
    logger.verbose(_tag, '_onActivatePressed()');

    _dialogService.popDialog(CardPosition.faceUpDefence);
  }

  void _onDestroyPressed() {
    logger.verbose(_tag, '_onDestroyPressed()');

    _dialogService.popDialog(CardPosition.destroy);
  }

  void _onSetPressed() {
    logger.verbose(_tag, '_onSetPressed()');

    if (_parameters.playCard.zoneType.isMultiCardZone && _parameters.newZone != null) {
      _setCardFromMultiCardZone();
      return;
    }

    if (playCard.zoneType.isMainMonsterZone) {
      _setMonsterCard();
      return;
    }

    _setSpellTrapCard();
  }

  void _setCardFromMultiCardZone() {
    logger.verbose(_tag, '_setCardFromMultiCardZone(');

    if (_parameters.newZone.zoneType.isMainMonsterZone) {
      _setMonsterCard();
    } else {
      _setSpellTrapCard();
    }
  }

  void _setMonsterCard() {
    logger.verbose(_tag, '_setMonsterCard()');

    if (_parameters.playCard.yugiohCard.type == CardType.token) {
      _dialogService.popDialog(CardPosition.faceUpDefence);
    } else {
      _dialogService.popDialog(CardPosition.faceDownDefence);
    }
  }

  void _setSpellTrapCard() {
    logger.verbose(_tag, '_setSpellTrapCard()');

    _dialogService.popDialog(CardPosition.faceDown);
  }
}
