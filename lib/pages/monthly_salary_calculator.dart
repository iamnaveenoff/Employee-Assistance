import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../navigation/navigation_drawer_widget.dart';

class MonthlySalaryCalculator extends StatefulWidget {
  const MonthlySalaryCalculator({Key? key}) : super(key: key);

  @override
  _MonthlySalaryCalculatorState createState() =>
      _MonthlySalaryCalculatorState();
}

class _MonthlySalaryCalculatorState extends State<MonthlySalaryCalculator> {
  final annualSalaryController = TextEditingController();
  double monthlySalary = 0.0;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    annualSalaryController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    annualSalaryController.dispose();
    super.dispose();
  }

  monthlySalaryCalculate(salary) {
    monthlySalary = int.parse(salary) / 12;
    return monthlySalary;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Monthly Salary Calculator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 90.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: annualSalaryController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter Annual Salary',
                    prefixIcon: Icon(FontAwesomeIcons.rupeeSign),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    monthlySalaryCalculate(annualSalaryController.text);
                    setState(() {
                      if (annualSalaryController.text.isEmpty) {
                        isVisible = false;
                      } else {
                        isVisible = true;
                      }
                    });
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 50),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      'Your Monthly Salary is : ₹' +
                          monthlySalary.toStringAsFixed(0),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
