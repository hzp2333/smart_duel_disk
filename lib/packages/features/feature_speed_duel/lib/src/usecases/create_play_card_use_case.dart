import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

@LazySingleton()
class CreatePlayCardUseCase {
  final EnumHelper _enumHelper;

  CreatePlayCardUseCase(
    this._enumHelper,
  );

  PlayCard call(
    YugiohCard card,
    String duelistId,
    int copyNumber, {
    CardPosition? position,
    ZoneType? zoneType,
  }) {
    final raceAndType =
        '[${_enumHelper.convertToString(card.race, camelCase: true)} / ${_enumHelper.convertToString(card.type, camelCase: true)}]';

    return PlayCard(
      yugiohCard: card,
      duelistId: duelistId,
      zoneType: zoneType ?? ZoneType.deck,
      position: position ?? CardPosition.faceUp,
      copyNumber: copyNumber,
      formattedRaceAndType: raceAndType,
      formattedAttack: card.atk == null ? null : 'ATK/${card.atk}',
      formattedDefence: card.def == null ? null : 'DEF/${card.def}',
      formattedLevel: card.level?.toString(),
      attributeAssetName: _getAttributeAssetName(card),
    );
  }

  String _getAttributeAssetName(YugiohCard card) {
    switch (card.attribute) {
      case CardAttribute.dark:
        return Assets.icons.icAttributeDark.path;
      case CardAttribute.earth:
        return Assets.icons.icAttributeEarth.path;
      case CardAttribute.light:
        return Assets.icons.icAttributeLight.path;
      case CardAttribute.wind:
        return Assets.icons.icAttributeWind.path;
      case CardAttribute.water:
        return Assets.icons.icAttributeWater.path;
      case CardAttribute.fire:
        return Assets.icons.icAttributeFire.path;
      case CardAttribute.divine:
        return Assets.icons.icAttributeDivine.path;
      case CardAttribute.unknown:
      case null:
        break;
    }

    switch (card.type) {
      case CardType.spellCard:
        return Assets.icons.icCardTypeSpell.path;
      case CardType.trapCard:
        return Assets.icons.icCardTypeTrap.path;
      default:
        break;
    }

    throw Exception('No attribute asset available.');
  }
}
