import 'package:hive/hive.dart';

part 'db_card_type.g.dart';

@HiveType(typeId: 4)
enum DbCardType {
  @HiveField(0)
  unknown,

  @HiveField(1)
  spellCard,

  @HiveField(2)
  flipEffectMonster,

  @HiveField(3)
  trapCard,

  @HiveField(4)
  effectMonster,

  @HiveField(5)
  normalMonster,

  @HiveField(6)
  fusionMonster,

  @HiveField(7)
  skillCard,

  @HiveField(8)
  ritualMonster,

  @HiveField(9)
  unionEffectMonster,

  @HiveField(10)
  toonMonster,

  @HiveField(11)
  ritualEffectMonster,

  @HiveField(12)
  token,
}
