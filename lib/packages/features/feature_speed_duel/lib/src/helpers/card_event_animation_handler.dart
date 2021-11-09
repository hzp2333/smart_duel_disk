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

  Future<void> onAttackCardEvent(PlayCard card, Zone targetZone) async {
    _logger.info(_tag, 'onAttackCardEvent(card: ${card.yugiohCard.id}, targetZone: ${targetZone.zoneType})');

    await _delayProvider.delay(AppDurations.preCardEventAnimationDelay);

    _cardAnimations.safeAdd(
      AttackAnimation(
        duelistId: card.duelistId,
        cardId: card.yugiohCard.id,
        copyNumber: card.copyNumber,
      ),
    );

    if (targetZone.zoneType.isMainMonsterZone && targetZone.cards.isNotEmpty) {
      final targettedCard = targetZone.cards.first;

      _cardAnimations.safeAdd(
        AttackAnimation(
          duelistId: targettedCard.duelistId,
          cardId: targettedCard.yugiohCard.id,
          copyNumber: targettedCard.copyNumber,
          waitTime: AppDurations.cardEventAnimationDuration * 2,
        ),
      );
    }
  }

  Future<void> onDeclareCardEvent(PlayCard card) async {
    _logger.info(_tag, 'onAttackCardEvent(card: ${card.yugiohCard.id})');

    _cardAnimations.safeAdd(
      DeclareAnimation(
        duelistId: card.duelistId,
        cardId: card.yugiohCard.id,
        copyNumber: card.copyNumber,
      ),
    );
  }

  @disposeMethod
  void dispose() {
    _cardAnimations.close();
  }
}
