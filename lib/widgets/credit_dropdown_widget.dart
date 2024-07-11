import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:dynamic_average_counter/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropDownWidget extends StatefulWidget {
  final Function onSelectedCredit;

  const CreditDropDownWidget({super.key, required this.onSelectedCredit});

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double selectedCreditsValue = 1;

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
        value: selectedCreditsValue,
        elevation: 16,
        iconEnabledColor: Constants.primaryColor,
        items: DataHelper.allCoursesCredits(),
        onChanged: (value) {
          setState(() {
            selectedCreditsValue = value!;
            widget.onSelectedCredit(selectedCreditsValue);
          });
        },
        underline: Container(),
      ),
    );
  }
}
