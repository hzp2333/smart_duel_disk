import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

@LazySingleton()
class GetCardsFromDeckUseCase {
  final DataManager _dataManager;
  final AssetsProvider _assetsProvider;
  final EnumHelper _enumHelper;

  GetCardsFromDeckUseCase(
    this._dataManager,
    this._assetsProvider,
    this._enumHelper,
  );

  Future<Iterable<PlayCard>> call(PreBuiltDeck deck) async {
    final allCards = await _dataManager.getSpeedDuelCards();
    final deckCardIds = await _dataManager.getPreBuiltDeckCardIds(deck);

    // TODO: as this is a heavy computation we should probably spawn an isolate.
    // Curently having a problem with that though: Invalid argument(s): Illegal argument in isolate message : (object is a closure - Function '<anonymous closure>':.)
    final yugiohCards = deckCardIds.map((id) => allCards.firstWhere((card) => card.id == id));

    final playCards = <PlayCard>[];

    for (final card in yugiohCards) {
      final copyNumber = playCards.where((playCard) => playCard.yugiohCard == card).length + 1;
      final raceAndType =
          '[${_enumHelper.convertToString(card.race, camelCase: true)} / ${_enumHelper.convertToString(card.type, camelCase: true)}]';

      playCards.add(PlayCard(
        yugiohCard: card,
        zoneType: ZoneType.deck,
        position: CardPosition.faceUp,
        copyNumber: copyNumber,
        formattedRaceAndType: raceAndType,
        formattedAttack: card.atk == null ? null : 'ATK/${card.atk}',
        formattedDefence: card.def == null ? null : 'DEF/${card.def}',
        formattedLevel: card.level?.toString(),
        attributeAssetName: _getAttributeAssetName(card, _assetsProvider),
      ));
    }

    return playCards;
  }

  String _getAttributeAssetName(YugiohCard card, AssetsProvider assetsProvider) {
    switch (card.attribute) {
      case CardAttribute.dark:
        return assetsProvider.iconAttributeDark;
      case CardAttribute.earth:
        return assetsProvider.iconAttributeEarth;
      case CardAttribute.light:
        return assetsProvider.iconAttributeLight;
      case CardAttribute.wind:
        return assetsProvider.iconAttributeWind;
      case CardAttribute.water:
        return assetsProvider.iconAttributeWater;
      case CardAttribute.fire:
        return assetsProvider.iconAttributeFire;
      case CardAttribute.divine:
        return assetsProvider.iconAttributeDivine;

      case CardAttribute.unknown:
        break;
    }

    switch (card.type) {
      case CardType.spellCard:
        return assetsProvider.iconCardTypeSpell;
      case CardType.trapCard:
        return assetsProvider.iconCardTypeTrap;

      case CardType.flipEffectMonster:
      case CardType.effectMonster:
      case CardType.normalMonster:
      case CardType.fusionMonster:
      case CardType.skillCard:
      case CardType.ritualMonster:
      case CardType.unionEffectMonster:
      case CardType.toonMonster:
      case CardType.ritualEffectMonster:
      case CardType.unknown:
        break;
    }

    return null;
  }
}
