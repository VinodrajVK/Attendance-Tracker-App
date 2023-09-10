import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/sub_data.dart';
import 'package:attendance_tracker/screens/add_class.dart';
import 'package:attendance_tracker/widgets/date_sum.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubDetails extends StatefulWidget {
  const SubDetails({
    super.key,
    required this.sub,
  });
  final Subject sub;
  @override
  State<StatefulWidget> createState() {
    return _SubDetailsState();
  }
}

class _SubDetailsState extends State<SubDetails> {
  void addNewClass() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) => AddClass(
                sub: widget.sub,
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sub.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: Boxes.getSubjects().listenable(),
          builder: (context, box, _) {
            int index = widget.sub.key;
            final sub = box.get(index);
            return buildContent(sub!);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewClass,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildContent(Subject sub) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'You attended ${sub.attendedClasses} out of ${sub.totalClasses}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Percentage : ${sub.percent}%',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...sub.presentDates.map((entry) {
                    return DateSum(date: entry, isAttended: true);
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ...sub.absentDates.map((entry) {
                    return DateSum(date: entry, isAttended: false);
                  }).toList(),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
