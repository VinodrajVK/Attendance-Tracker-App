import 'package:attendance_tracker/data/boxes.dart';
import 'package:attendance_tracker/data/sub_data.dart';
import 'package:attendance_tracker/screens/entry_screen.dart';
import 'package:attendance_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Initializes Hive with a valid directory in your app files
  await Hive.initFlutter();
// Register Hive Adapter
  Hive.registerAdapter(SubjectAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SemestersAdapter());
// open box
  await Hive.openBox<Subject>('subBox');
  await Hive.openBox<User>('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget _setScreen() {
    final box = Boxes.getUser();
    return (box.isEmpty) ? (const EntryScreen()) : (const HomeScreen());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Tracker',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
      ),
      home: _setScreen(),
    );
  }
}
