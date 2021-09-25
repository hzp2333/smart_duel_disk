import 'package:hive/hive.dart';

part 'db_card_race.g.dart';

@HiveType(typeId: 3)
enum DbCardRace {
  @HiveField(0)
  unknown,

  @HiveField(1)
  equip,

  @HiveField(2)
  beast,

  @HiveField(3)
  normal,

  @HiveField(4)
  rock,

  @HiveField(5)
  ritual,

  @HiveField(6)
  fairy,

  @HiveField(7)
  insect,

  @HiveField(8)
  dragon,

  @HiveField(9)
  machine,

  @HiveField(10)
  warrior,

  @HiveField(11)
  field,

  @HiveField(12)
  fiend,

  @HiveField(13)
  dinosaur,

  @HiveField(14)
  spellcaster,

  @HiveField(15)
  continuous,

  @HiveField(16)
  zombie,

  @HiveField(17)
  mai,

  @HiveField(18)
  keith,

  @HiveField(19)
  beastWarrior,

  @HiveField(20)
  yamiYugi,

  @HiveField(21)
  kaiba,

  @HiveField(22)
  wingedBeast,

  @HiveField(23)
  quickPlay,

  @HiveField(24)
  bonz,

  @HiveField(25)
  mako,

  @HiveField(26)
  counter,

  @HiveField(27)
  aqua,

  @HiveField(28)
  weevil,

  @HiveField(29)
  fish,

  @HiveField(30)
  yugi,

  @HiveField(31)
  david,

  @HiveField(32)
  rex,

  @HiveField(33)
  odion,

  @HiveField(34)
  christine,

  @HiveField(35)
  reptile,

  @HiveField(36)
  ishizu,

  @HiveField(37)
  joey,

  @HiveField(38)
  yamiMarik,

  @HiveField(39)
  joeyWheeler,

  @HiveField(40)
  seaSerpent,

  @HiveField(41)
  yamiBakura,

  @HiveField(42)
  pegasus,

  @HiveField(43)
  espaRoba,

  @HiveField(44)
  setoKaiba,

  @HiveField(45)
  pyro,

  @HiveField(46)
  andrew,

  @HiveField(47)
  arkana,

  @HiveField(48)
  maiValentine,

  @HiveField(49)
  divineBeast,

  @HiveField(50)
  teaGardner,

  @HiveField(51)
  ishizuIshtar,

  @HiveField(52)
  emma,

  @HiveField(53)
  lumisUmbra,
}
