// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_card_race.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbCardRaceAdapter extends TypeAdapter<DbCardRace> {
  @override
  final int typeId = 3;

  @override
  DbCardRace read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DbCardRace.unknown;
      case 1:
        return DbCardRace.equip;
      case 2:
        return DbCardRace.beast;
      case 3:
        return DbCardRace.normal;
      case 4:
        return DbCardRace.rock;
      case 5:
        return DbCardRace.ritual;
      case 6:
        return DbCardRace.fairy;
      case 7:
        return DbCardRace.insect;
      case 8:
        return DbCardRace.dragon;
      case 9:
        return DbCardRace.machine;
      case 10:
        return DbCardRace.warrior;
      case 11:
        return DbCardRace.field;
      case 12:
        return DbCardRace.fiend;
      case 13:
        return DbCardRace.dinosaur;
      case 14:
        return DbCardRace.spellcaster;
      case 15:
        return DbCardRace.continuous;
      case 16:
        return DbCardRace.zombie;
      case 17:
        return DbCardRace.mai;
      case 18:
        return DbCardRace.keith;
      case 19:
        return DbCardRace.beastWarrior;
      case 20:
        return DbCardRace.yamiYugi;
      case 21:
        return DbCardRace.kaiba;
      case 22:
        return DbCardRace.wingedBeast;
      case 23:
        return DbCardRace.quickPlay;
      case 24:
        return DbCardRace.bonz;
      case 25:
        return DbCardRace.mako;
      case 26:
        return DbCardRace.counter;
      case 27:
        return DbCardRace.aqua;
      case 28:
        return DbCardRace.weevil;
      case 29:
        return DbCardRace.fish;
      case 30:
        return DbCardRace.yugi;
      case 31:
        return DbCardRace.david;
      case 32:
        return DbCardRace.rex;
      case 33:
        return DbCardRace.odion;
      case 34:
        return DbCardRace.christine;
      case 35:
        return DbCardRace.reptile;
      case 36:
        return DbCardRace.ishizu;
      case 37:
        return DbCardRace.joey;
      case 38:
        return DbCardRace.yamiMarik;
      case 39:
        return DbCardRace.joeyWheeler;
      case 40:
        return DbCardRace.seaSerpent;
      case 41:
        return DbCardRace.yamiBakura;
      case 42:
        return DbCardRace.pegasus;
      case 43:
        return DbCardRace.espaRoba;
      case 44:
        return DbCardRace.setoKaiba;
      case 45:
        return DbCardRace.pyro;
      case 46:
        return DbCardRace.andrew;
      case 47:
        return DbCardRace.arkana;
      case 48:
        return DbCardRace.maiValentine;
      case 49:
        return DbCardRace.divineBeast;
      case 50:
        return DbCardRace.teaGardner;
      case 51:
        return DbCardRace.ishizuIshtar;
      case 52:
        return DbCardRace.emma;
      case 53:
        return DbCardRace.lumisUmbra;
      case 54:
        return DbCardRace.drVellianCrowler;
      case 55:
        return DbCardRace.chazzPrinceton;
      case 56:
        return DbCardRace.axelBrodie;
      case 57:
        return DbCardRace.yubel;
      case 58:
        return DbCardRace.jesseAnderson;
      case 59:
        return DbCardRace.alexisRhodes;
      case 60:
        return DbCardRace.zaneTruesdale;
      case 61:
        return DbCardRace.bastionMisawa;
      case 62:
        return DbCardRace.jadenYuki;
      case 63:
        return DbCardRace.tyrannoHassleberry;
      case 64:
        return DbCardRace.asterPhoenix;
      case 65:
        return DbCardRace.syrusTruesdale;
      default:
        return DbCardRace.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, DbCardRace obj) {
    switch (obj) {
      case DbCardRace.unknown:
        writer.writeByte(0);
        break;
      case DbCardRace.equip:
        writer.writeByte(1);
        break;
      case DbCardRace.beast:
        writer.writeByte(2);
        break;
      case DbCardRace.normal:
        writer.writeByte(3);
        break;
      case DbCardRace.rock:
        writer.writeByte(4);
        break;
      case DbCardRace.ritual:
        writer.writeByte(5);
        break;
      case DbCardRace.fairy:
        writer.writeByte(6);
        break;
      case DbCardRace.insect:
        writer.writeByte(7);
        break;
      case DbCardRace.dragon:
        writer.writeByte(8);
        break;
      case DbCardRace.machine:
        writer.writeByte(9);
        break;
      case DbCardRace.warrior:
        writer.writeByte(10);
        break;
      case DbCardRace.field:
        writer.writeByte(11);
        break;
      case DbCardRace.fiend:
        writer.writeByte(12);
        break;
      case DbCardRace.dinosaur:
        writer.writeByte(13);
        break;
      case DbCardRace.spellcaster:
        writer.writeByte(14);
        break;
      case DbCardRace.continuous:
        writer.writeByte(15);
        break;
      case DbCardRace.zombie:
        writer.writeByte(16);
        break;
      case DbCardRace.mai:
        writer.writeByte(17);
        break;
      case DbCardRace.keith:
        writer.writeByte(18);
        break;
      case DbCardRace.beastWarrior:
        writer.writeByte(19);
        break;
      case DbCardRace.yamiYugi:
        writer.writeByte(20);
        break;
      case DbCardRace.kaiba:
        writer.writeByte(21);
        break;
      case DbCardRace.wingedBeast:
        writer.writeByte(22);
        break;
      case DbCardRace.quickPlay:
        writer.writeByte(23);
        break;
      case DbCardRace.bonz:
        writer.writeByte(24);
        break;
      case DbCardRace.mako:
        writer.writeByte(25);
        break;
      case DbCardRace.counter:
        writer.writeByte(26);
        break;
      case DbCardRace.aqua:
        writer.writeByte(27);
        break;
      case DbCardRace.weevil:
        writer.writeByte(28);
        break;
      case DbCardRace.fish:
        writer.writeByte(29);
        break;
      case DbCardRace.yugi:
        writer.writeByte(30);
        break;
      case DbCardRace.david:
        writer.writeByte(31);
        break;
      case DbCardRace.rex:
        writer.writeByte(32);
        break;
      case DbCardRace.odion:
        writer.writeByte(33);
        break;
      case DbCardRace.christine:
        writer.writeByte(34);
        break;
      case DbCardRace.reptile:
        writer.writeByte(35);
        break;
      case DbCardRace.ishizu:
        writer.writeByte(36);
        break;
      case DbCardRace.joey:
        writer.writeByte(37);
        break;
      case DbCardRace.yamiMarik:
        writer.writeByte(38);
        break;
      case DbCardRace.joeyWheeler:
        writer.writeByte(39);
        break;
      case DbCardRace.seaSerpent:
        writer.writeByte(40);
        break;
      case DbCardRace.yamiBakura:
        writer.writeByte(41);
        break;
      case DbCardRace.pegasus:
        writer.writeByte(42);
        break;
      case DbCardRace.espaRoba:
        writer.writeByte(43);
        break;
      case DbCardRace.setoKaiba:
        writer.writeByte(44);
        break;
      case DbCardRace.pyro:
        writer.writeByte(45);
        break;
      case DbCardRace.andrew:
        writer.writeByte(46);
        break;
      case DbCardRace.arkana:
        writer.writeByte(47);
        break;
      case DbCardRace.maiValentine:
        writer.writeByte(48);
        break;
      case DbCardRace.divineBeast:
        writer.writeByte(49);
        break;
      case DbCardRace.teaGardner:
        writer.writeByte(50);
        break;
      case DbCardRace.ishizuIshtar:
        writer.writeByte(51);
        break;
      case DbCardRace.emma:
        writer.writeByte(52);
        break;
      case DbCardRace.lumisUmbra:
        writer.writeByte(53);
        break;
      case DbCardRace.drVellianCrowler:
        writer.writeByte(54);
        break;
      case DbCardRace.chazzPrinceton:
        writer.writeByte(55);
        break;
      case DbCardRace.axelBrodie:
        writer.writeByte(56);
        break;
      case DbCardRace.yubel:
        writer.writeByte(57);
        break;
      case DbCardRace.jesseAnderson:
        writer.writeByte(58);
        break;
      case DbCardRace.alexisRhodes:
        writer.writeByte(59);
        break;
      case DbCardRace.zaneTruesdale:
        writer.writeByte(60);
        break;
      case DbCardRace.bastionMisawa:
        writer.writeByte(61);
        break;
      case DbCardRace.jadenYuki:
        writer.writeByte(62);
        break;
      case DbCardRace.tyrannoHassleberry:
        writer.writeByte(63);
        break;
      case DbCardRace.asterPhoenix:
        writer.writeByte(64);
        break;
      case DbCardRace.syrusTruesdale:
        writer.writeByte(65);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbCardRaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
