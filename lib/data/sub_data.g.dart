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

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..name = fields[0] as String
      ..semester = fields[1] as Semesters;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.semester);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SemestersAdapter extends TypeAdapter<Semesters> {
  @override
  final int typeId = 2;

  @override
  Semesters read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Semesters.physicscycle;
      case 1:
        return Semesters.chemistrycycle;
      case 2:
        return Semesters.third;
      case 3:
        return Semesters.fourth;
      case 4:
        return Semesters.fifth;
      case 5:
        return Semesters.sixth;
      case 6:
        return Semesters.seventh;
      case 7:
        return Semesters.eighth;
      default:
        return Semesters.physicscycle;
    }
  }

  @override
  void write(BinaryWriter writer, Semesters obj) {
    switch (obj) {
      case Semesters.physicscycle:
        writer.writeByte(0);
        break;
      case Semesters.chemistrycycle:
        writer.writeByte(1);
        break;
      case Semesters.third:
        writer.writeByte(2);
        break;
      case Semesters.fourth:
        writer.writeByte(3);
        break;
      case Semesters.fifth:
        writer.writeByte(4);
        break;
      case Semesters.sixth:
        writer.writeByte(5);
        break;
      case Semesters.seventh:
        writer.writeByte(6);
        break;
      case Semesters.eighth:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SemestersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
