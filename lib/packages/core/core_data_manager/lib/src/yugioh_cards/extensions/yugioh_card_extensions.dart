import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

extension YugiohCardExtensions on YugiohCard {
  DbYugiohCard toDbModel() {
    final cardType = DbCardType.values.byName(type.name);
    final cardRace = DbCardRace.values.byName(race.name);
    final cardAttribute =
        attribute?.name == null ? DbCardAttribute.unknown : DbCardAttribute.values.byName(attribute!.name);

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
