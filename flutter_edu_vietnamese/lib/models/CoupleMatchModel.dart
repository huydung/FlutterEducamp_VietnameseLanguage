import 'dart:math';

import '../consts.dart';

//https://www.raywenderlich.com/6373413-state-management-with-provider

class CoupleMatchViewModel {
  final Person _p1 =
      new Person(Gender.MALE, DateTime.now().year - 45 + Random().nextInt(30));
  final Person _p2 = new Person(
      Gender.FEMALE, DateTime.now().year - 45 + Random().nextInt(30));

  Person get p1 => _p1;
  Person get p2 => _p2;

  void setGenderP1(Gender gender) {
    _p1.gender = gender;
  }

  void setGenderP2(Gender gender) {
    _p2.gender = gender;
  }

  void setBirthYearP1(int year) {
    _p1.birthYear = year;
  }

  void setBirthYearP2(int year) {
    _p2.birthYear = year;
  }
}

class Person {
  Gender gender;
  int birthYear;

  Person(this.gender, this.birthYear);
}
