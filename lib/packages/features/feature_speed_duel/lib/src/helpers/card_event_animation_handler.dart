import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@LazySingleton()
class CardEventAnimationHandler {
  static const _tag = 'CardEventAnimationHandler';

  final DelayProvider _delayProvider;
  final Logger _logger;

  final _cardAnimations = PublishSubject<CardAnimation>();
  Stream<CardAnimation> get cardAnimations => _cardAnimations.stream;

  CardEventAnimationHandler(
    this._delayProvider,
    this._logger,
  );

  Future<void> onAttackCardEvent(PlayCard attackingCard, Zone targetZone) async {
    _logger.info(
      _tag,
      'onAttackCardEvent(attackingCard: ${attackingCard.yugiohCard.id}, targetZone: ${targetZone.zoneType})',
    );

    await _delayProvider.delay(AppDurations.preCardAnimationDelay);

    _cardAnimations.safeAdd(
      AttackAnimation(
        duelistId: attackingCard.duelistId,
        cardId: attackingCard.yugiohCard.id,
        copyNumber: attackingCard.copyNumber,
      ),
    );

    if (targetZone.zoneType.isMainMonsterZone) {
      final targettedCard = targetZone.cards.first;

      _cardAnimations.safeAdd(
        AttackAnimation(
          duelistId: targettedCard.duelistId,
          cardId: targettedCard.yugiohCard.id,
          copyNumber: targettedCard.copyNumber,
          waitTime: AppDurations.cardAnimationDuration * 2,
        ),
      );
    }
  }

  @disposeMethod
  void dispose() {
    _cardAnimations.close();
  }
}
