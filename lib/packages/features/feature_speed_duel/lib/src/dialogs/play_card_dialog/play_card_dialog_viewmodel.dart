import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/use_cases/create_play_card_dialog_actions_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

import 'models/play_card_dialog_action.dart';

@Injectable()
class PlayCardDialogViewModel extends BaseViewModel {
  static const _tag = 'PlayCardDialogViewModel';

  final PlayCard _playCard;
  final Zone _newZone;
  final CreatePlayCardDialogActionsUseCase _createPlayCardDialogActionsUseCase;
  final DialogService _dialogService;

  PlayCard get playCard => _playCard;

  Iterable<PlayCardDialogAction> _cardActions = [];
  Iterable<PlayCardDialogAction> get cardActions => _cardActions;

  PlayCardDialogViewModel(
    @factoryParam this._playCard,
    @factoryParam this._newZone,
    this._createPlayCardDialogActionsUseCase,
    this._dialogService,
    Logger logger,
  ) : super(logger) {
    _cardActions = _createPlayCardDialogActionsUseCase(_playCard, _newZone);
  }

  void onPlayCardDialogActionPressed(PlayCardDialogActionType actionType) {
    logger.info(_tag, 'onPlayCardDialogActionPressed(actionType: $actionType)');

    actionType.when(
      summon: _onSummonPressed,
      activate: _onActivatePressed,
      toAttack: _onChangeToAttackPressed,
      toDefence: _onChangeToDefencePressed,
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

    if (playCard.zoneType.isMultiCardZone && _newZone != null) {
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

    if (_newZone.zoneType.isMainMonsterZone) {
      _setMonsterCard();
    } else {
      _setSpellTrapCard();
    }
  }

  void _setMonsterCard() {
    logger.verbose(_tag, '_setMonsterCard()');

    if (_playCard.yugiohCard.type == CardType.token) {
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
