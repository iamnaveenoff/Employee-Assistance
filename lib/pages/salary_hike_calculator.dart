import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:office_assistance/navigation/navigation_drawer_widget.dart';

class SalaryHikeCalculator extends StatefulWidget {
  const SalaryHikeCalculator({Key? key}) : super(key: key);

  @override
  _SalaryHikeCalculatorState createState() => _SalaryHikeCalculatorState();
}

class _SalaryHikeCalculatorState extends State<SalaryHikeCalculator> {
  final annualSalaryController = TextEditingController();
  final expectedHikeController = TextEditingController();
  double monthlySalary = 0;
  int hikedSalary = 0;
  double result = 0;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    annualSalaryController.addListener(() => setState(() {}));
    expectedHikeController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    annualSalaryController.dispose();
    expectedHikeController.dispose();
    super.dispose();
  }

  calulateHike() {
    if (annualSalaryController.text.isNotEmpty &&
        expectedHikeController.text.isNotEmpty) {
      hikedSalary = int.parse(annualSalaryController.text) *
          int.parse(expectedHikeController.text);
      result = hikedSalary / 100;
      monthlySalary = result / 12;
    }
    return monthlySalary;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Salary Hike Calculator',
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
                  controller: annualSalaryController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Enter Annual CTC',
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
                const SizedBox(height: 24),
                TextField(
                  controller: expectedHikeController,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Expected Hike %',
                    // hintText: 'Please Enter Your Annual Salary',
                    prefixIcon: Icon(FontAwesomeIcons.percentage),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (annualSalaryController.text.isNotEmpty &&
                          expectedHikeController.text.isNotEmpty) {
                        isVisible = true;
                      } else {
                        isVisible = false;
                      }
                      calulateHike();
                    });
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
                ),
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
                          monthlySalary.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
