import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'zone.dart';
import 'zone_type.dart';

@immutable
class PlayerState extends Equatable {
  final Zone hand;
  final Zone fieldZone;
  final Zone mainMonsterZone1;
  final Zone mainMonsterZone2;
  final Zone mainMonsterZone3;
  final Zone graveyardZone;
  final Zone banishedZone;
  final Zone extraDeckZone;
  final Zone spellTrapZone1;
  final Zone spellTrapZone2;
  final Zone spellTrapZone3;
  final Zone deckZone;

  Iterable<Zone> get zones => [
        hand,
        fieldZone,
        mainMonsterZone1,
        mainMonsterZone2,
        mainMonsterZone3,
        graveyardZone,
        banishedZone,
        extraDeckZone,
        spellTrapZone1,
        spellTrapZone2,
        spellTrapZone3,
        deckZone,
      ];

  Iterable<Zone> get mainMonsterZones => [
        mainMonsterZone1,
        mainMonsterZone2,
        mainMonsterZone3,
      ];

  const PlayerState({
    this.hand = const Zone(zoneType: ZoneType.hand),
    this.fieldZone = const Zone(zoneType: ZoneType.field),
    this.mainMonsterZone1 = const Zone(zoneType: ZoneType.mainMonster1),
    this.mainMonsterZone2 = const Zone(zoneType: ZoneType.mainMonster2),
    this.mainMonsterZone3 = const Zone(zoneType: ZoneType.mainMonster3),
    this.graveyardZone = const Zone(zoneType: ZoneType.graveyard),
    this.banishedZone = const Zone(zoneType: ZoneType.banished),
    this.extraDeckZone = const Zone(zoneType: ZoneType.extraDeck),
    this.spellTrapZone1 = const Zone(zoneType: ZoneType.spellTrap1),
    this.spellTrapZone2 = const Zone(zoneType: ZoneType.spellTrap2),
    this.spellTrapZone3 = const Zone(zoneType: ZoneType.spellTrap3),
    this.deckZone = const Zone(zoneType: ZoneType.deck),
  });

  PlayerState copyWith({
    Zone hand,
    Zone fieldZone,
    Zone mainMonsterZone1,
    Zone mainMonsterZone2,
    Zone mainMonsterZone3,
    Zone graveyardZone,
    Zone banishedZone,
    Zone extraDeckZone,
    Zone spellTrapZone1,
    Zone spellTrapZone2,
    Zone spellTrapZone3,
    Zone deckZone,
  }) {
    return PlayerState(
      hand: hand ?? this.hand,
      fieldZone: fieldZone ?? this.fieldZone,
      mainMonsterZone1: mainMonsterZone1 ?? this.mainMonsterZone1,
      mainMonsterZone2: mainMonsterZone2 ?? this.mainMonsterZone2,
      mainMonsterZone3: mainMonsterZone3 ?? this.mainMonsterZone3,
      graveyardZone: graveyardZone ?? this.graveyardZone,
      banishedZone: banishedZone ?? this.banishedZone,
      extraDeckZone: extraDeckZone ?? this.extraDeckZone,
      spellTrapZone1: spellTrapZone1 ?? this.spellTrapZone1,
      spellTrapZone2: spellTrapZone2 ?? this.spellTrapZone2,
      spellTrapZone3: spellTrapZone3 ?? this.spellTrapZone3,
      deckZone: deckZone ?? this.deckZone,
    );
  }

  @override
  List<Object> get props => [
        hand,
        fieldZone,
        mainMonsterZone1,
        mainMonsterZone2,
        mainMonsterZone3,
        graveyardZone,
        banishedZone,
        extraDeckZone,
        spellTrapZone1,
        spellTrapZone2,
        spellTrapZone3,
        deckZone,
      ];

  @override
  bool get stringify => true;
}
