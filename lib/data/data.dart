import 'package:attendance_tracker/data/sub_data.dart';

enum Subjectspc {
  max10,
  phx10,
  mex10,
  eex10,
  csx10,
  phx2l,
  csx2l,
  hux10,
}

enum Subjectscc {
  max10,
  chx10,
  cvx10,
  ecx10,
  mex20,
  chx2l,
  hux20,
  hux30,
}

enum Subjects3 {
  cs310,
  cs320,
  cs330,
  cs340,
  cs350,
  cs36l,
  cs37l,
  hu311,
}

enum Subjects4 {
  cs410,
  cs420,
  cs430,
  cs440,
  cs450,
  cs46l,
  cs47l,
  hu412,
}

enum Subjects5 {
  cs510,
  cs520,
  cs530,
  cs540,
  cs552,
  cs57l,
  cs58l,
  oe1,
}

enum Subjects6 {
  cs610,
  cs620,
  cs630,
  pe2,
  oe2,
  oe3,
  cs67l,
  cs69l,
}

enum Subjects7 {
  cs710,
  pe3,
  pe4,
  oe4,
  oe5,
}

enum Subjects8 {
  pe5,
  pe6,
}

Map<Semesters, List<String>> semesterData = {
  Semesters.chemistrycycle:
      Subjectscc.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.physicscycle:
      Subjectspc.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.third: Subjects3.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.fourth: Subjects4.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.fifth: Subjects5.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.sixth: Subjects6.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.seventh: Subjects7.values.map((e) => e.name.toUpperCase()).toList(),
  Semesters.eighth: Subjects8.values.map((e) => e.name.toUpperCase()).toList(),
};
