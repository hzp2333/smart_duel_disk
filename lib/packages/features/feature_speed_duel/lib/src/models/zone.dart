import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'play_card.dart';
import 'zone_type.dart';

@immutable
class Zone extends Equatable {
  final ZoneType zoneType;
  final String duelistId;
  final Iterable<PlayCard> cards;

  const Zone({
    @required this.zoneType,
    @required this.duelistId,
    this.cards = const [],
  });

  bool get isEmpty => cards.isEmpty;

  Zone copyWith({Iterable<PlayCard> cards}) {
    return Zone(
      zoneType: zoneType,
      duelistId: duelistId,
      cards: cards ?? this.cards,
    );
  }

  @override
  List<Object> get props => [
        zoneType,
        duelistId,
        cards,
      ];

  @override
  bool get stringify => true;
}
