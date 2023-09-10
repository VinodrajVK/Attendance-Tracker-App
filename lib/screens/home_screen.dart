import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/initializer.dart';
import 'package:attendance_tracker/data/sub_data.dart';
import 'package:attendance_tracker/screens/sub_details.dart';
import 'package:attendance_tracker/widgets/sub_att_summary.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Initialize initbox = Initialize();
  List<Subject> subList = [];
  @override
  void initState() {
    final box = Boxes.getSubjects();
    if (box.isEmpty) {
      initbox.initialData();
    }
    super.initState();
  }

  void _changeScreen(Subject sub) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => SubDetails(sub: sub)),
    );
  }

  @override
  void dispose() {
    Hive.box('subBox').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: Boxes.getSubjects().listenable(),
          builder: (context, box, _) {
            final subjects = box.values.toList().cast<Subject>();
            return buildContent(subjects);
          }),
    );
  }

  Widget buildContent(List<Subject> subjects) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Current Status',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          ...subjects.map((sub) => SubSummary(
                sub: sub,
                changeScreen: _changeScreen,
              )),
          const SizedBox(
            height: 25,
          ),
          Text(
            'To add a Class of a Subject Click on That Subject',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
