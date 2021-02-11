import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

import 'zone_type.dart';

@immutable
class PlayCard extends Equatable {
  final YugiohCard yugiohCard;
  final ZoneType zoneType;
  final int copyNumber;

  const PlayCard({
    @required this.yugiohCard,
    @required this.zoneType,
    @required this.copyNumber,
  });

  PlayCard copyWith({ZoneType zoneType}) {
    return PlayCard(
      yugiohCard: yugiohCard,
      zoneType: zoneType ?? this.zoneType,
      copyNumber: copyNumber,
    );
  }

  @override
  List<Object> get props => [
        yugiohCard,
        zoneType,
        copyNumber,
      ];

  @override
  bool get stringify => true;
}
