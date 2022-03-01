import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

extension DbYugiohCardExtensions on DbYugiohCard {
  YugiohCard toEntity() {
    final cardType = CardType.values.byName(type.name);
    final cardRace = CardRace.values.byName(race.name);
    final cardAttribute =
        attribute?.name == null ? CardAttribute.unknown : CardAttribute.values.byName(attribute!.name);

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
