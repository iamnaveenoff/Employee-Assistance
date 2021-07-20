import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    if (salary.toString().isNotEmpty) {
      monthlySalary = int.parse(salary) / 12;
      return monthlySalary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Monthly Salary Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                  onChanged: (value) => {
                    monthlySalaryCalculate(annualSalaryController.text),
                    setState(
                      () {
                        if (value.isNotEmpty) {
                          isVisible = true;
                        } else {
                          isVisible = false;
                        }
                      },
                    )
                  },
                  controller: annualSalaryController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Enter Annual Salary',
                    // hintText: 'Please Enter Your Annual Salary',
                    prefixIcon: Icon(FontAwesomeIcons.rupeeSign),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                /*ElevatedButton(
                  onPressed: () {
                    monthlySalaryCalculate(annualSalaryController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),*/
                const SizedBox(height: 50),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.only(
                        top: 80, bottom: 80, left: 30, right: 30),
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
