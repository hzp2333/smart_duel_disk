import 'package:injectable/injectable.dart';
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
      toAttack: (card) => _onChangeToAttackPressed(playCard),
      toDefense: (card) => _onChangeToDefencePressed(playCard),
      set: (card, zone) => _onSetPressed(card, zone),
    );
  }

  void _onSummonPressed() {
    logger.verbose(_tag, '_onSummonPressed()');

    _dialogService.popDialog(CardPosition.faceUp);
  }

  void _onChangeToAttackPressed(PlayCard playCard) {
    logger.verbose(_tag, '_onChangeToAttackPressed(playCard: $playCard)');

    if (playCard.position == CardPosition.faceUpDefence) {
      _dialogService.popDialog(CardPosition.faceUp);
    } else {
      _dialogService.popDialog(CardPosition.faceDown);
    }
  }

  void _onChangeToDefencePressed(PlayCard playCard) {
    logger.verbose(_tag, '_onChangeToDefencePressed(playCard: $playCard)');

    if (playCard.position == CardPosition.faceUp) {
      _dialogService.popDialog(CardPosition.faceUpDefence);
    } else {
      _dialogService.popDialog(CardPosition.faceDownDefence);
    }
  }

  void _onActivatePressed() {
    logger.verbose(_tag, '_onActivatePressed()');

    _dialogService.popDialog(CardPosition.faceUp);
  }

  void _onSetPressed(PlayCard playCard, Zone newZone) {
    logger.verbose(_tag, '_onSetPressed(playCard: $playCard, newZone: $newZone)');

    if (playCard.zoneType.isMultiCardZone && newZone != null) {
      _setCardFromMultiCardZone(newZone);
      return;
    }

    if (playCard.zoneType.isMainMonsterZone) {
      _setMonsterCard(playCard);
      return;
    }

    _setSpellTrapCard();
  }

  void _setCardFromMultiCardZone(Zone newZone) {
    logger.verbose(_tag, '_setCardFromMultiCardZone(newZone: $newZone)');

    if (newZone.zoneType.isMainMonsterZone) {
      _dialogService.popDialog(CardPosition.faceDownDefence);
    } else {
      _dialogService.popDialog(CardPosition.faceDown);
    }
  }

  void _setMonsterCard(PlayCard playCard) {
    logger.verbose(_tag, '_setMonsterCard(playCard: $playCard)');

    if (playCard.position.isAttack) {
      _dialogService.popDialog(CardPosition.faceDown);
    } else {
      _dialogService.popDialog(CardPosition.faceDownDefence);
    }
  }

  void _setSpellTrapCard() {
    logger.verbose(_tag, '_setSpellTrapCard()');

    _dialogService.popDialog(CardPosition.faceDown);
  }
}
