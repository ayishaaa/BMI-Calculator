import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('BMI calculator'),
            centerTitle: true,
            backgroundColor: Colors.pinkAccent,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _heightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'height in cm',
                    icon: Icon(Icons.trending_up),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _weightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'weight in kg',
                    icon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  child: Text(
                    "calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: calculateBMI,
                ),
                SizedBox(height: 15),
                Text(
                  _result == null
                      ? "Enter Value"
                      : "${_result?.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void calculateBMI() {
    double height = double.parse(_heightcontroller.text) / 100;
    double weight = double.parse(_weightcontroller.text) / 100;

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;

    setState(() {});
  }
}
