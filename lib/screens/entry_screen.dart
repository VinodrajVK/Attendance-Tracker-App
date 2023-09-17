import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/sub_data.dart';
import 'package:attendance_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _EntryScreenState();
  }
}

class _EntryScreenState extends State<EntryScreen> {
  final _nameController = TextEditingController();
  Semesters semSelected = Semesters.chemistrycycle;
  final box = Boxes.getUser();

  void _setData() {
    final enteredName = _nameController.text.trim();
    setState(() {
      if (enteredName.isNotEmpty) {
        User user = User();
        user.name = _nameController.text;
        user.semester = semSelected;
        box.add(user);
      }
      if (box.isNotEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/attendance.jpg',
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Attendance Tracker App",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 40),
          Text(
            'Welcome',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Enter Your Name"),
              initialValue: null,
              controller: _nameController,
              validator: (name) {
                return (name!.isEmpty) ? 'Name not Entered' : null;
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DropdownButton<Semesters>(
              dropdownColor: Colors.cyan,
              iconDisabledColor: Colors.green,
              hint: Text(
                'Select Semester',
                style: Theme.of(context).textTheme.headlineLarge!,
              ),
              value: semSelected,
              items: Semesters.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name.toUpperCase()),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  semSelected = value!;
                });
              }),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _setData,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Submit',
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  const Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
