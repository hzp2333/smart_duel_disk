import 'package:hive/hive.dart';

part 'db_card_attribute.g.dart';

@HiveType(typeId: 2)
enum DbCardAttribute {
  @HiveField(0)
  unknown,

  @HiveField(1)
  dark,

  @HiveField(2)
  earth,

  @HiveField(3)
  light,

  @HiveField(4)
  wind,

  @HiveField(5)
  water,

  @HiveField(6)
  fire,

  @HiveField(7)
  divine,
}
