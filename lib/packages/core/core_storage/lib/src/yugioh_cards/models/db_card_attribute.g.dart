// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_card_attribute.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbCardAttributeAdapter extends TypeAdapter<DbCardAttribute> {
  @override
  final int typeId = 2;

  @override
  DbCardAttribute read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DbCardAttribute.unknown;
      case 1:
        return DbCardAttribute.dark;
      case 2:
        return DbCardAttribute.earth;
      case 3:
        return DbCardAttribute.light;
      case 4:
        return DbCardAttribute.wind;
      case 5:
        return DbCardAttribute.water;
      case 6:
        return DbCardAttribute.fire;
      case 7:
        return DbCardAttribute.divine;
      default:
        return DbCardAttribute.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, DbCardAttribute obj) {
    switch (obj) {
      case DbCardAttribute.unknown:
        writer.writeByte(0);
        break;
      case DbCardAttribute.dark:
        writer.writeByte(1);
        break;
      case DbCardAttribute.earth:
        writer.writeByte(2);
        break;
      case DbCardAttribute.light:
        writer.writeByte(3);
        break;
      case DbCardAttribute.wind:
        writer.writeByte(4);
        break;
      case DbCardAttribute.water:
        writer.writeByte(5);
        break;
      case DbCardAttribute.fire:
        writer.writeByte(6);
        break;
      case DbCardAttribute.divine:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbCardAttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
