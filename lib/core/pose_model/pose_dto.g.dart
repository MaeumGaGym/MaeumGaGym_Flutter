// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pose_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PoseDtoAdapter extends TypeAdapter<PoseDto> {
  @override
  final int typeId = 1;

  @override
  PoseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PoseDto(
      id: fields[1] as int,
      thumbnail: fields[4] as String,
      name: fields[3] as String,
      needMachine: fields[2] as bool,
      simplePart: (fields[5] as List).cast<String>(),
      exactPart: (fields[6] as List).cast<String>(),
      category: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PoseDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.needMachine)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.simplePart)
      ..writeByte(6)
      ..write(obj.exactPart)
      ..writeByte(7)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PoseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
