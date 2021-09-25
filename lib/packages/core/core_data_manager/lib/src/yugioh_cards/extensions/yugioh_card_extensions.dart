import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

extension YugiohCardExtensions on YugiohCard {
  DbYugiohCard toDbModel(EnumHelper enumHelper) {
    final cardType = enumHelper.fromString(DbCardType.values, enumHelper.convertToString(type)) ?? DbCardType.unknown;
    final cardRace = enumHelper.fromString(DbCardRace.values, enumHelper.convertToString(race)) ?? DbCardRace.unknown;
    final cardAttribute =
        enumHelper.fromString(DbCardAttribute.values, enumHelper.convertToString(attribute)) ?? DbCardAttribute.unknown;

    return DbYugiohCard(
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
