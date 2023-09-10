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
