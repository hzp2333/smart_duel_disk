import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:universal_io/io.dart';

import 'card_position.dart';
import 'zone_type.dart';

@immutable
class PlayCard extends Equatable {
  final YugiohCard yugiohCard;
  final File? image;
  final String duelistId;
  final ZoneType zoneType;
  final CardPosition position;
  final int copyNumber;
  final String formattedRaceAndType;
  final String? attributeAssetName;
  final int counters;
  final bool revealed;
  final String? formattedAttack;
  final String? formattedDefence;
  final String? formattedLevel;

  const PlayCard({
    required this.yugiohCard,
    required this.image,
    required this.duelistId,
    required this.zoneType,
    required this.position,
    required this.copyNumber,
    required this.formattedRaceAndType,
    required this.attributeAssetName,
    this.counters = 0,
    this.revealed = false,
    this.formattedAttack,
    this.formattedDefence,
    this.formattedLevel,
  });

  bool get belongsInExtraDeck => yugiohCard.belongsInExtraDeck;
  bool get isMonster => yugiohCard.isMonster;

  PlayCard copyWith({ZoneType? zoneType, CardPosition? position, int? counters, bool? revealed}) {
    return PlayCard(
      yugiohCard: yugiohCard,
      duelistId: duelistId,
      image: image,
      zoneType: zoneType ?? this.zoneType,
      position: position ?? this.position,
      copyNumber: copyNumber,
      formattedRaceAndType: formattedRaceAndType,
      attributeAssetName: attributeAssetName,
      counters: counters ?? this.counters,
      revealed: revealed ?? this.revealed,
      formattedAttack: formattedAttack,
      formattedDefence: formattedDefence,
      formattedLevel: formattedLevel,
    );
  }

  PlayCard copyAndAddCounter() => copyWith(counters: counters + 1);
  PlayCard copyAndRemoveCounter() => counters > 0 ? copyWith(counters: counters - 1) : copyWith(counters: 0);

  @override
  List<Object?> get props => [
        yugiohCard,
        duelistId,
        zoneType,
        position,
        copyNumber,
        formattedRaceAndType,
        attributeAssetName,
        counters,
        revealed,
        formattedAttack,
        formattedDefence,
        formattedLevel,
      ];

  @override
  bool get stringify => true;
}
