import 'package:hive_flutter/hive_flutter.dart';
part 'sub_data.g.dart';

@HiveType(typeId: 0)
class Subject extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late int totalClasses;

  @HiveField(2)
  late int attendedClasses;

  @HiveField(3)
  late List<DateTime> presentDates;

  @HiveField(4)
  late List<DateTime> absentDates;

  @HiveField(5)
  int percent = 0;
}

@HiveType(typeId: 2)
enum Semesters {
  @HiveField(0)
  physicscycle,
  @HiveField(1)
  chemistrycycle,
  @HiveField(2)
  third,
  @HiveField(3)
  fourth,
  @HiveField(4)
  fifth,
  @HiveField(5)
  sixth,
  @HiveField(6)
  seventh,
  @HiveField(7)
  eighth,
}

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late Semesters semester;
}
