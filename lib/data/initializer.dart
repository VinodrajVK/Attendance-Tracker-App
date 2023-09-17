import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/sub_data.dart';
import 'package:attendance_tracker/data/data.dart';

class Initialize {
  final subBox = Boxes.getSubjects();
  final box = Boxes.getUser();
  void initialData() {
    if (box.isNotEmpty) {
      User? user = box.values.first;
      Semesters sem = user.semester;
      for (var item in semesterData[sem]!) {
        Subject sub = Subject();
        sub.absentDates = [];
        sub.attendedClasses = 0;
        sub.percent = 0;
        sub.presentDates = [];
        sub.title = item;
        sub.totalClasses = 0;
        subBox.add(sub);
      }
    }
  }
}
