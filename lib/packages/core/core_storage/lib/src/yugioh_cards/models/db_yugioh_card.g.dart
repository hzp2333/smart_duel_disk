// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_yugioh_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbYugiohCardAdapter extends TypeAdapter<DbYugiohCard> {
  @override
  final int typeId = 1;

  @override
  DbYugiohCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbYugiohCard(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as DbCardType,
      description: fields[3] as String,
      race: fields[4] as DbCardRace,
      imageSmallUrl: fields[5] as String,
      imageLargeUrl: fields[6] as String,
      atk: fields[7] as int?,
      def: fields[8] as int?,
      level: fields[9] as int?,
      attribute: fields[10] as DbCardAttribute?,
      archetype: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DbYugiohCard obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.race)
      ..writeByte(5)
      ..write(obj.imageSmallUrl)
      ..writeByte(6)
      ..write(obj.imageLargeUrl)
      ..writeByte(7)
      ..write(obj.atk)
      ..writeByte(8)
      ..write(obj.def)
      ..writeByte(9)
      ..write(obj.level)
      ..writeByte(10)
      ..write(obj.attribute)
      ..writeByte(11)
      ..write(obj.archetype);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbYugiohCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
