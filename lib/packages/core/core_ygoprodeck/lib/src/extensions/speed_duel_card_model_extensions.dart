import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

import '../models/speed_duel_card_model.dart';

extension SpeedDuelCardModelExtensions on SpeedDuelCardModel {
  YugiohCard toEntity() {
    return YugiohCard(
      id: id,
      name: name,
      type: parseCardType(type),
      description: desc,
      race: parseCardRace(race),
      imageSmallUrl: cardImages.first.imageUrlSmall,
      imageLargeUrl: cardImages.first.imageUrl,
      atk: atk,
      def: def,
      level: level,
      attribute: parseCardAttribute(attribute),
      archetype: archetype,
    );
  }
}
