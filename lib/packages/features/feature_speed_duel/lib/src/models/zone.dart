import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';

import 'zone_type.dart';

@immutable
class Zone extends Equatable {
  final ZoneType zoneType;
  final Iterable<YugiohCard> cards;

  const Zone({
    @required this.zoneType,
    this.cards = const [],
  });

  Zone copyWith({Iterable<YugiohCard> cards}) {
    return Zone(
      zoneType: zoneType,
      cards: cards ?? this.cards,
    );
  }

  @override
  List<Object> get props => [
        zoneType,
        cards,
      ];

  @override
  bool get stringify => true;
}
