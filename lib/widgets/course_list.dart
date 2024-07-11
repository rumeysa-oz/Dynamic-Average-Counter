import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:dynamic_average_counter/helper/data_helper.dart';
import 'package:dynamic_average_counter/model/course.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  // Bunu ekledim
  final Function onDissmissing;

  const CourseList({Key? key, required this.onDissmissing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> allCourses = DataHelper.allAddedCourses;

    return allCourses.length > 0
        ? ListView.builder(
            itemCount: allCourses.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                // Bunları ekledim
                onDismissed: (d) {
                  onDissmissing(index);
                  debugPrint('Element dissmissed at index: $index');
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allCourses[index].courseName),
                      leading: CircleAvatar(
                        backgroundColor: Constants.primaryColor,
                        child: Text((allCourses[index].letterGrade *
                                allCourses[index].creditValue)
                            .toStringAsFixed(1)),
                      ),
                      subtitle: Text(
                        'Credit Value: ${allCourses[index].creditValue}, Letter Grade: ${allCourses[index].letterGrade}',
                      ),
                    ),
                  ),
                ),
              );
            })
        : Container(
            // Bunu ekledim
            child: Center(
              child: Text(
                'Please Add Some Courses',
                style: Constants.titleStyle,
              ),
            ),
          );
  }
}
