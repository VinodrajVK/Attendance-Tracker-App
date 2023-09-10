import 'package:attendance_tracker/data/sub_data.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Subject> getSubjects() => Hive.box<Subject>('subBox');
}
