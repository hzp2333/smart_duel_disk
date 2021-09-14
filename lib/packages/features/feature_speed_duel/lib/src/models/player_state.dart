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

  Zone getZone(ZoneType zoneType) => zones.firstWhere((zone) => zone.zoneType == zoneType);

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
      ];

  const PlayerState({
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
  }) {
    return PlayerState(
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
    );
  }

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
      ];

  @override
  bool get stringify => true;
}
