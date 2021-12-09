import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

@LazySingleton()
class SpeedDuelEventEmitter {
  static const _tag = 'SpeedDuelEventEmitter';

  final SmartDuelServer _smartDuelServer;
  final EnumHelper _enumHelper;
  final Logger _logger;

  SpeedDuelEventEmitter(
    this._smartDuelServer,
    this._enumHelper,
    this._logger,
  );

  //region Card events

  void sendPlayCardEvent(PlayCard card, ZoneType zoneType, CardPosition newPosition) {
    _logger.info(
      _tag,
      'sendPlayCardEvent(card: ${card.yugiohCard.id}, zoneType: $zoneType, newPosition: $newPosition)',
    );

    _smartDuelServer.emitEvent(
      SmartDuelEvent.playCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
          cardPosition: _enumHelper.convertToString(newPosition),
          zoneName: _enumHelper.convertToString(zoneType),
        ),
      ),
    );
  }

  void sendRemoveCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendRemoveCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.removeCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendAttackCardEvent(PlayCard card, ZoneType zoneType) {
    _logger.info(_tag, 'sendAttackCardEvent(card: ${card.yugiohCard.id}, zoneType: $zoneType)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.attackCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
          zoneName: _enumHelper.convertToString(zoneType),
        ),
      ),
    );
  }

  void sendDeclareCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendDeclareCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.declareCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendAddCounterToCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendAddCounterToCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.addCounterToCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendRemoveCounterFromCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendRemoveCounterFromCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.removeCounterFromCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendRevealCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendRevealCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.revealCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendHideCardEvent(PlayCard card) {
    _logger.info(_tag, 'sendHideCardEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.hideCard(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void sendGiveCardToOpponentEvent(PlayCard card) {
    _logger.info(_tag, 'sendGiveCardToOpponentEvent(card: ${card.yugiohCard.id})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.giveCardToOpponent(
        CardEventData(
          duelistId: card.duelistId,
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  //endregion

  //region Room events

  void sendSurrenderEvent(DuelRoom duelRoom) {
    _logger.info(_tag, 'sendSurrenderEvent(duelRoom: ${duelRoom.roomName})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.surrenderRoom(
        RoomEventData(roomName: duelRoom.roomName),
      ),
    );
  }

  //endregion

  //region Deck events

  void sendShuffleDeckEvent() {
    _logger.info(_tag, 'sendShuffleDeckEvent()');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.shuffleDeck(
        DeckEventData(duelistId: _smartDuelServer.getDuelistId()!),
      ),
    );
  }

  //endregion

  //region Duelist events

  void sendRollDiceEvent() {
    _logger.info(_tag, 'sendRollDiceEvent()');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.rollDice(
        DuelistEventData(duelistId: _smartDuelServer.getDuelistId()!),
      ),
    );
  }

  void sendFlipCoinEvent() {
    _logger.info(_tag, 'sendFlipCoinEvent()');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.flipCoin(
        DuelistEventData(duelistId: _smartDuelServer.getDuelistId()!),
      ),
    );
  }

  void sendDeclarePhaseEvent(DuelPhaseType duelPhaseType) {
    _logger.info(_tag, 'sendDeclarePhaseEvent(duelPhaseType: $duelPhaseType)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.declarePhase(
        DuelistEventData(
          duelistId: _smartDuelServer.getDuelistId()!,
          phase: duelPhaseType,
        ),
      ),
    );
  }

  void sendEndTurnEvent() {
    _logger.info(_tag, 'sendEndTurnEvent()');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.endTurn(
        DuelistEventData(duelistId: _smartDuelServer.getDuelistId()!),
      ),
    );
  }

  void sendUpdateLifepointsEvent(int lifepoints) {
    _logger.info(_tag, 'sendUpdateLifepointsEvent(lifepoints: $lifepoints)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.updateLifepoints(
        DuelistEventData(
          duelistId: _smartDuelServer.getDuelistId()!,
          lifepoints: lifepoints,
        ),
      ),
    );
  }

  //endregion
}
