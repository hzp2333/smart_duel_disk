import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

extension DbYugiohCardExtensions on DbYugiohCard {
  YugiohCard toEntity(EnumHelper enumHelper) {
    final cardType = enumHelper.fromString(CardType.values, enumHelper.convertToString(type)) ?? CardType.unknown;
    final cardRace = enumHelper.fromString(CardRace.values, enumHelper.convertToString(race)) ?? CardRace.unknown;
    final cardAttribute =
        enumHelper.fromString(CardAttribute.values, enumHelper.convertToString(attribute)) ?? CardAttribute.unknown;

    return YugiohCard(
      id: id,
      name: name,
      type: cardType,
      description: description,
      race: cardRace,
      imageSmallUrl: imageSmallUrl,
      imageLargeUrl: imageLargeUrl,
      atk: atk,
      def: def,
      level: level,
      attribute: cardAttribute,
      archetype: archetype,
    );
  }
}
