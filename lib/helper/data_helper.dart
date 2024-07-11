import 'package:dynamic_average_counter/model/course.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Course> allAddedCourses = [];

  static addCourse(Course course) {
    allAddedCourses.add(course);
  }

  static averageCalculate() {
    double totalGrade = 0;
    double totalCredit = 0;

    allAddedCourses.forEach((element) {
      totalGrade = totalGrade + (element.letterGrade * element.creditValue);
      totalCredit = totalCredit + element.creditValue;
    });

    return totalGrade / totalCredit;
  }

  static List<String> _allCoursesLetters() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FF'];
  }

  static double? _convertLetterToGrade(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allCoursesLetters() {
    return _allCoursesLetters()
        .map((e) => DropdownMenuItem<double>(
              value: _convertLetterToGrade(e),
              child: Text(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCoursesCredits() {
    return _allCredits()
        .map((e) => DropdownMenuItem<double>(
              value: e.toDouble(),
              child: Text(e.toString()),
            ))
        .toList();
  }
}
