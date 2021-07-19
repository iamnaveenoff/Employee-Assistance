import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:office_assistance/navigation/navigation_drawer_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const Main());
}

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
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(
            'Office Assistance',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const Center(
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
