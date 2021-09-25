// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_card_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbCardTypeAdapter extends TypeAdapter<DbCardType> {
  @override
  final int typeId = 4;

  @override
  DbCardType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DbCardType.unknown;
      case 1:
        return DbCardType.spellCard;
      case 2:
        return DbCardType.flipEffectMonster;
      case 3:
        return DbCardType.trapCard;
      case 4:
        return DbCardType.effectMonster;
      case 5:
        return DbCardType.normalMonster;
      case 6:
        return DbCardType.fusionMonster;
      case 7:
        return DbCardType.skillCard;
      case 8:
        return DbCardType.ritualMonster;
      case 9:
        return DbCardType.unionEffectMonster;
      case 10:
        return DbCardType.toonMonster;
      case 11:
        return DbCardType.ritualEffectMonster;
      case 12:
        return DbCardType.token;
      default:
        return DbCardType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, DbCardType obj) {
    switch (obj) {
      case DbCardType.unknown:
        writer.writeByte(0);
        break;
      case DbCardType.spellCard:
        writer.writeByte(1);
        break;
      case DbCardType.flipEffectMonster:
        writer.writeByte(2);
        break;
      case DbCardType.trapCard:
        writer.writeByte(3);
        break;
      case DbCardType.effectMonster:
        writer.writeByte(4);
        break;
      case DbCardType.normalMonster:
        writer.writeByte(5);
        break;
      case DbCardType.fusionMonster:
        writer.writeByte(6);
        break;
      case DbCardType.skillCard:
        writer.writeByte(7);
        break;
      case DbCardType.ritualMonster:
        writer.writeByte(8);
        break;
      case DbCardType.unionEffectMonster:
        writer.writeByte(9);
        break;
      case DbCardType.toonMonster:
        writer.writeByte(10);
        break;
      case DbCardType.ritualEffectMonster:
        writer.writeByte(11);
        break;
      case DbCardType.token:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbCardTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
