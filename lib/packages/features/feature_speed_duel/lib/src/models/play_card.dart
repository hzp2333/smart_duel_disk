import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

import 'zone_type.dart';

@immutable
class PlayCard {
  final YugiohCard yugiohCard;
  final ZoneType zoneType;

  const PlayCard({
    @required this.yugiohCard,
    @required this.zoneType,
  });

  PlayCard copyWith({ZoneType zoneType}) {
    return PlayCard(
      yugiohCard: yugiohCard,
      zoneType: zoneType ?? this.zoneType,
    );
  }
}
