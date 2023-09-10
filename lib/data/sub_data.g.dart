// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 0;

  @override
  Subject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subject()
      ..title = fields[0] as String
      ..totalClasses = fields[1] as int
      ..attendedClasses = fields[2] as int
      ..presentDates = (fields[3] as List).cast<DateTime>()
      ..absentDates = (fields[4] as List).cast<DateTime>()
      ..percent = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.totalClasses)
      ..writeByte(2)
      ..write(obj.attendedClasses)
      ..writeByte(3)
      ..write(obj.presentDates)
      ..writeByte(4)
      ..write(obj.absentDates)
      ..writeByte(5)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
