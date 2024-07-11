import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:dynamic_average_counter/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropDownWidget extends StatefulWidget {

  // Bunu ekledim
  final Function onSelectedLetter;

  const LetterDropDownWidget({super.key, required this.onSelectedLetter});

  @override
  State<LetterDropDownWidget> createState() => _LetterDropDownWidgetState();
}

class _LetterDropDownWidgetState extends State<LetterDropDownWidget> {
  double selectedLetterValue = 4;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.primaryColor.shade200.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.primaryColor,
        items: DataHelper.allCoursesLetters(),
        onChanged: (value) {
          setState(() {
            selectedLetterValue = value!;
            // Bunu ekledim
            widget.onSelectedLetter(selectedLetterValue);
          });
        },
        underline: Container(),
      ),
    );
  }
}
