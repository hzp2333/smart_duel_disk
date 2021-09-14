import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'card_attribute.dart';
import 'card_race.dart';
import 'card_type.dart';

@immutable
class YugiohCard extends Equatable {
  final int id;
  final String name;
  final CardType type;
  final String description;
  final CardRace race;
  final String imageSmallUrl;
  final String imageLargeUrl;
  final int? atk;
  final int? def;
  final int? level;
  final CardAttribute? attribute;
  final String? archetype;

  const YugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.race,
    required this.imageSmallUrl,
    required this.imageLargeUrl,
    this.atk,
    this.def,
    this.level,
    this.attribute,
    this.archetype,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        description,
        race,
        imageSmallUrl,
        imageLargeUrl,
        atk,
        def,
        level,
        attribute,
        archetype,
      ];

  @override
  bool get stringify => true;
}
