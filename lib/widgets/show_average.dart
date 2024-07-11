import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int courseNumbers;
  const ShowAverage(
      {super.key, required this.average, required this.courseNumbers});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              courseNumbers > 0
                  ? '$courseNumbers Courses Entered'
                  : 'Select a course',
              style: Constants.coursesNumberStyle),
          Text(
            average >= 0 ? average.toStringAsFixed(2) : '0.0',
            style: Constants.averageStyle,
          ),
          Text(
            'Average',
            style: Constants.averageTextStyle,
          ),
        ]);
  }
}
