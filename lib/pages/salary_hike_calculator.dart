import 'package:flutter/material.dart';
import 'package:office_assistance/navigation/navigation_drawer_widget.dart';

class SalaryHikeCalculator extends StatefulWidget {
  const SalaryHikeCalculator({Key? key}) : super(key: key);

  @override
  _SalaryHikeCalculatorState createState() => _SalaryHikeCalculatorState();
}

class _SalaryHikeCalculatorState extends State<SalaryHikeCalculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Salary Hike Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const Center(
          child: Text(
            'Salary Hike Calculator',
            style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
