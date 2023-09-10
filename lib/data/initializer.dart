import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/sub_data.dart';

enum Subjects {
  cs510,
  cs520,
  cs530,
  cs540,
  cs552,
  cs57l,
  cs58l,
  oe,
}

class Initialize {
  final subBox = Boxes.getSubjects();

  void initialData() {
    for (var item in Subjects.values) {
      Subject sub = Subject();
      sub.absentDates = [];
      sub.attendedClasses = 0;
      sub.percent = 0;
      sub.presentDates = [];
      sub.title = item.name.toUpperCase();
      sub.totalClasses = 0;
      subBox.add(sub);
    }
  }
}
