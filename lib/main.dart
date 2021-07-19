import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salary Calculator',
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      if(annualSalaryController.text.isEmpty){
                        isVisible = false;
                      }else{
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
                    decoration: const BoxDecoration(color: Colors.greenAccent),
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      'Your Monthly Salary is : ₹' + monthlySalary.toString(),
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
