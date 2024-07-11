import 'package:dynamic_average_counter/constants/app_constant.dart';
import 'package:dynamic_average_counter/widgets/average_calculate_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Average Calculation',
      theme: ThemeData(
        primarySwatch: Constants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AverageCalculationPage(),
    );
  }
}
