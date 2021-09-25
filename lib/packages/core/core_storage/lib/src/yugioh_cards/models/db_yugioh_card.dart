import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'db_card_attribute.dart';
import 'db_card_race.dart';
import 'db_card_type.dart';

part 'db_yugioh_card.g.dart';

@immutable
@HiveType(typeId: 1)
class DbYugiohCard extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DbCardType type;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final DbCardRace race;

  @HiveField(5)
  final String imageSmallUrl;

  @HiveField(6)
  final String imageLargeUrl;

  @HiveField(7)
  final int? atk;

  @HiveField(8)
  final int? def;

  @HiveField(9)
  final int? level;

  @HiveField(10)
  final DbCardAttribute? attribute;

  @HiveField(11)
  final String? archetype;

  const DbYugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.race,
    required this.imageSmallUrl,
    required this.imageLargeUrl,
    required this.atk,
    required this.def,
    required this.level,
    required this.attribute,
    required this.archetype,
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
