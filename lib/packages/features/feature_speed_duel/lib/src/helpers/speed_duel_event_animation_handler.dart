import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@LazySingleton()
class SpeedDuelEventAnimationHandler {
  static const _tag = 'SpeedDuelEventAnimationHandler';

  final DelayProvider _delayProvider;
  final Logger _logger;

  final _animationEvents = PublishSubject<SpeedDuelAnimation>();
  Stream<SpeedDuelAnimation> get animationEvents => _animationEvents.stream;

  SpeedDuelEventAnimationHandler(
    this._delayProvider,
    this._logger,
  );

  Future<void> onAttackCardEvent(PlayCard card, Zone targetZone) async {
    _logger.info(_tag, 'onAttackCardEvent(card: ${card.yugiohCard.id}, targetZone: ${targetZone.zoneType})');

    await _delayProvider.delay(AppDurations.preSpeedDuelEventAnimationDelay);

    _animationEvents.safeAdd(
      AttackAnimation(
        duelistId: card.duelistId,
        cardId: card.yugiohCard.id,
        copyNumber: card.copyNumber,
      ),
    );

    if (targetZone.zoneType.isMainMonsterZone && targetZone.cards.isNotEmpty) {
      final targettedCard = targetZone.cards.first;

      _animationEvents.safeAdd(
        AttackAnimation(
          duelistId: targettedCard.duelistId,
          cardId: targettedCard.yugiohCard.id,
          copyNumber: targettedCard.copyNumber,
          waitTime: AppDurations.speedDuelEventAnimationDuration * 2,
        ),
      );
    }
  }

  Future<void> onDeclareCardEvent(PlayCard card) async {
    _logger.info(_tag, 'onDeclareCardEvent(card: ${card.yugiohCard.id})');

    await _delayProvider.delay(AppDurations.preSpeedDuelEventAnimationDelay);

    _animationEvents.safeAdd(
      DeclareAnimation(
        duelistId: card.duelistId,
        cardId: card.yugiohCard.id,
        copyNumber: card.copyNumber,
      ),
    );
  }

  Future<void> onShuffleDeckEvent(String duelistId) async {
    _logger.info(_tag, 'onShuffleDeckEvent(duelistId: $duelistId)');

    await _delayProvider.delay(AppDurations.preSpeedDuelEventAnimationDelay);

    _animationEvents.safeAdd(
      ShuffleAnimation(
        duelistId: duelistId,
      ),
    );
  }

  @disposeMethod
  void dispose() {
    _animationEvents.close();
  }
}
