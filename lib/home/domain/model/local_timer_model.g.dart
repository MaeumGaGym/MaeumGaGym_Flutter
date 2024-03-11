// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_timer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalTimerModelAdapter extends TypeAdapter<LocalTimerModel> {
  @override
  final int typeId = 1;

  @override
  LocalTimerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalTimerModel(
      timerId: fields[1] as int,
      hours: fields[2] as int,
      minutes: fields[3] as int,
      seconds: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalTimerModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.timerId)
      ..writeByte(2)
      ..write(obj.hours)
      ..writeByte(3)
      ..write(obj.minutes)
      ..writeByte(4)
      ..write(obj.seconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalTimerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
