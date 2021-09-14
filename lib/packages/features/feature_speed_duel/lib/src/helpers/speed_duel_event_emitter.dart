import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

@LazySingleton()
class SpeedDuelEventEmitter {
  static const _tag = 'SpeedDuelEventHandler';

  final SmartDuelServer _smartDuelServer;
  final EnumHelper _enumHelper;
  final Logger _logger;

  SpeedDuelEventEmitter(
    this._smartDuelServer,
    this._enumHelper,
    this._logger,
  );

  void sendPlayCardEvent(PlayCard card, ZoneType zoneType, CardPosition newPosition) {
    _logger.info(
      _tag,
      'sendPlayCardEvent(card: ${card.yugiohCard.id}, zoneType: $zoneType, newPosition: $newPosition)',
    );

    _smartDuelServer.emitEvent(
      SmartDuelEvent.playCard(
        CardEventData(
          duelistId: _smartDuelServer.getDuelistId(),
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
          duelistId: _smartDuelServer.getDuelistId(),
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
          duelistId: _smartDuelServer.getDuelistId(),
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
          zoneName: _enumHelper.convertToString(zoneType),
        ),
      ),
    );
  }

  void sendSurrenderEvent(DuelRoom duelRoom) {
    _logger.info(_tag, 'sendSurrenderEvent(duelRoom: ${duelRoom.roomName})');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.surrenderRoom(
        RoomEventData(roomName: duelRoom.roomName),
      ),
    );
  }
}
