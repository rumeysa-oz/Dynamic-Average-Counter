import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:dynamic_average_counter/helper/data_helper.dart';
import 'package:dynamic_average_counter/model/course.dart';
import 'package:dynamic_average_counter/widgets/course_list.dart';
import 'package:dynamic_average_counter/widgets/credit_dropdown_widget.dart';
import 'package:dynamic_average_counter/widgets/letter_dropdown_widget.dart';
import 'package:dynamic_average_counter/widgets/show_average.dart';
import 'package:flutter/material.dart';

class AverageCalculationPage extends StatefulWidget {
  const AverageCalculationPage({super.key});

  @override
  State<AverageCalculationPage> createState() => _AverageCalculationPageState();
}

class _AverageCalculationPageState extends State<AverageCalculationPage> {
  var formKey = GlobalKey<FormState>();

  double selectedLetterValue = 4;
  double selectedCreditsValue = 1;

  String selectedCourse = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Constants.titleText, style: Constants.titleStyle),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
              flex: 1,
              child: ShowAverage(
                courseNumbers: DataHelper.allAddedCourses.length,
                average: DataHelper.averageCalculate(),
              ),
            ),
          ],
        ),
        Expanded(
          child: CourseList(
            onDissmissing: (index) {
              DataHelper.allAddedCourses.removeAt(index);
              setState(() {});
            },
          ),
        ),
      ]),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  child: LetterDropDownWidget(
                    onSelectedLetter: (letter) {
                      setState(() {
                        selectedLetterValue = letter;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding8,
                  // Bunu ekledim
                  child: CreditDropDownWidget(onSelectedCredit: (credit) {
                    setState(() {
                      selectedCreditsValue = credit;
                    });
                  }),
                ),
              ),
              IconButton(
                onPressed: _addedCourseAndCalculateAverage,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.primaryColor,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          selectedCourse = newValue!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Please enter a course';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter a course',
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.primaryColor.shade100.withOpacity(0.5),
      ),
    );
  }

  _addedCourseAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var addedCourse = Course(
          courseName: selectedCourse,
          letterGrade: selectedLetterValue,
          creditValue: selectedCreditsValue);
      DataHelper.addCourse(addedCourse);
      setState(() {});
    }
  }
}
