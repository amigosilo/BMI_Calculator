import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime),
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(
        title: 'BMI Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 1; // Gender value
  double _bmi = 0; // Double value of BMI
  String _bmiStr = ''; // BMI value represented as String
  String _bmiCat = ''; // BMI Category represented as String
  int _height = 183; // Initial value, actual value is taken from slider value
  int _weight = 70; // Initial value, actual value is taken from slider value
  void _calculate() {
    // Function to calculate BMI
    setState(() {
      _bmi = (_weight / ((_height / 100) * (_height / 100)));
      _bmiStr = _bmi.toStringAsFixed(1);
      if (_bmi <= 18.5) {
        _bmiCat = 'Underweight';
      } else if (_bmi > 18.5 && _bmi <= 25.0) {
        _bmiCat = 'Normal weight';
      } else if (_bmi > 25.0 && _bmi <= 30.0) {
        _bmiCat = 'Overweight';
      } else if (_bmi > 30.0) {
        _bmiCat = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text("Male"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text("Female"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text("Other"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$_height',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    )
                ),
                const Text(' cm',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    )),
              ],
            ),

            //slide bar
            Container(
              width: 380,
              height: 80,
              color: Colors.grey[850],
              child: Slider(
                value: _height.toDouble(),
                min: 100,
                max: 200,
                label: _height.toString(),
                onChanged: (double value) {
                  setState(() {
                    _height = value.round();
                  });
                },
              ),
            ),
            const SizedBox(
              width: 380,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_weight',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  ' kg',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              width: 380,
              height: 80,
              color: Colors.grey[850],
              child: Slider(
                value: _weight.toDouble(),
                min: 40,
                max: 200,
                label: _weight.toString(),
                onChanged: (double value) {
                  setState(() {
                    _weight = value.round();
                  });
                },
              ),
            ),
            const SizedBox(
              width: 380,
              height: 20,
            ),
            Container(
              width: 300,
              height: 80,
              color: Colors.grey[100],
              child: Row(
                // Widget for showing result BMI
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Your BMI: ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    _bmiStr,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 380,
              height: 20,
            ),

            Row(
              // Widget for button to calculate BMI
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 380,
              height: 20,
            ),
            Container(
              width: 300,
              height: 80,
              color: Colors.grey[100],
              child: Column(
                // Widget for showing BMI category
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'BMI Category: ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    _bmiCat,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
