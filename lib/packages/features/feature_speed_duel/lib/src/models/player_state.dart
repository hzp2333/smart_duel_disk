import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

import 'play_card.dart';
import 'zone.dart';

@immutable
class PlayerState extends Equatable {
  final String duelistId;
  final bool isOpponent;
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
  final Zone skillZone;

  PlayerState({
    required this.duelistId,
    required this.isOpponent,
  })  : hand = Zone(zoneType: ZoneType.hand, duelistId: duelistId),
        fieldZone = Zone(zoneType: ZoneType.field, duelistId: duelistId),
        mainMonsterZone1 = Zone(zoneType: ZoneType.mainMonster1, duelistId: duelistId),
        mainMonsterZone2 = Zone(zoneType: ZoneType.mainMonster2, duelistId: duelistId),
        mainMonsterZone3 = Zone(zoneType: ZoneType.mainMonster3, duelistId: duelistId),
        graveyardZone = Zone(zoneType: ZoneType.graveyard, duelistId: duelistId),
        banishedZone = Zone(zoneType: ZoneType.banished, duelistId: duelistId),
        extraDeckZone = Zone(zoneType: ZoneType.extraDeck, duelistId: duelistId),
        spellTrapZone1 = Zone(zoneType: ZoneType.spellTrap1, duelistId: duelistId),
        spellTrapZone2 = Zone(zoneType: ZoneType.spellTrap2, duelistId: duelistId),
        spellTrapZone3 = Zone(zoneType: ZoneType.spellTrap3, duelistId: duelistId),
        deckZone = Zone(zoneType: ZoneType.deck, duelistId: duelistId),
        skillZone = Zone(zoneType: ZoneType.skill, duelistId: duelistId);

  const PlayerState._({
    required this.duelistId,
    required this.isOpponent,
    required this.hand,
    required this.fieldZone,
    required this.mainMonsterZone1,
    required this.mainMonsterZone2,
    required this.mainMonsterZone3,
    required this.graveyardZone,
    required this.banishedZone,
    required this.extraDeckZone,
    required this.spellTrapZone1,
    required this.spellTrapZone2,
    required this.spellTrapZone3,
    required this.deckZone,
    required this.skillZone,
  });

  PlayerState copyWith({
    Zone? hand,
    Zone? fieldZone,
    Zone? mainMonsterZone1,
    Zone? mainMonsterZone2,
    Zone? mainMonsterZone3,
    Zone? graveyardZone,
    Zone? banishedZone,
    Zone? extraDeckZone,
    Zone? spellTrapZone1,
    Zone? spellTrapZone2,
    Zone? spellTrapZone3,
    Zone? deckZone,
    Zone? skillZone,
  }) {
    return PlayerState._(
      duelistId: duelistId,
      isOpponent: isOpponent,
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
      skillZone: skillZone ?? this.skillZone,
    );
  }

  PlayerState copyWithAllZones(List<Zone> updatedZones) {
    return PlayerState._(
      duelistId: duelistId,
      isOpponent: isOpponent,
      hand: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.hand),
      fieldZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.field),
      mainMonsterZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster1),
      mainMonsterZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster2),
      mainMonsterZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster3),
      graveyardZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.graveyard),
      banishedZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.banished),
      extraDeckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.extraDeck),
      spellTrapZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap1),
      spellTrapZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap2),
      spellTrapZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap3),
      deckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.deck),
      skillZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.skill),
    );
  }

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
        skillZone,
      ];

  Zone getZone(ZoneType zoneType) => zones.firstWhere((zone) => zone.zoneType == zoneType);

  Zone getZoneWithCard(PlayCard card) => zones.firstWhere((zone) => zone.cards.contains(card));

  Iterable<Zone> get mainMonsterZones => [
        mainMonsterZone1,
        mainMonsterZone2,
        mainMonsterZone3,
      ];

  Iterable<PlayCard?> get cards => [
        ...hand.cards,
        ...fieldZone.cards,
        ...mainMonsterZone1.cards,
        ...mainMonsterZone2.cards,
        ...mainMonsterZone3.cards,
        ...graveyardZone.cards,
        ...banishedZone.cards,
        ...extraDeckZone.cards,
        ...spellTrapZone1.cards,
        ...spellTrapZone2.cards,
        ...spellTrapZone3.cards,
        ...deckZone.cards,
        ...skillZone.cards,
      ];

  @override
  List<Object?> get props => [
        duelistId,
        isOpponent,
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
        skillZone,
      ];

  @override
  bool get stringify => true;
}
