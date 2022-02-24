import 'package:flutter/material.dart';

import 'calculator_btn.dart';

void main() {
  runApp(CalculateApp());
}

class CalculateApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CalculateAppState();
    throw UnimplementedError();
  }
}

class _CalculateAppState extends State<CalculateApp> {
  late int no1;
  late int no2;
  late String history = '';
  late String display = '';
  late String res;
  late String operation;

  btnOnClick(String val) {
    print(val);
    if (val == 'C') {
      display = '';
      no1 = 0;
      no2 = 0;
      res = '';
    } else if (val == 'AC') {
      display = '';
      no1 = 0;
      no2 = 0;
      res = '';
      history = '';
    } else if (val == '<-') {
      res = display.substring(0, display.length - 1);
    } else if (val == '+' || val == '-' || val == 'x' || val == '/') {
      no1 = int.parse(display);
      res = '';
      operation = val;
    } else if (val == '=') {
      no2 = int.parse(display);
      if (operation == '+') {
        res = (no1 + no2).toString();
        history = no1.toString() + operation.toString() + no2.toString();
      }
      if (operation == '-') {
        res = (no1 - no2).toString();
        history = no1.toString() + operation.toString() + no2.toString();
      }
      if (operation == 'x') {
        res = (no1 * no2).toString();
        history = no1.toString() + operation.toString() + no2.toString();
      }
      if (operation == '/') {
        res = (no1 / no2).toString();
        history = no1.toString() + operation.toString() + no2.toString();
      }
    } else {
      res = int.parse(display + val).toString();
    }
    setState(() {
      display = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Calculator"),
              backgroundColor: Colors.black,
            ),
            body: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    history,
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    display,
                    style: TextStyle(color: Colors.black, fontSize: 50),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    no: 'AC',
                    fillColor: 0xFF880E4F,
                    callback: btnOnClick,
                  ),
                  CalcButton(no: 'C', fillColor: 0xFF880E4F, callback: btnOnClick),
                  CalcButton(no: '<-', fillColor: 0xFF880E4F, callback: btnOnClick),
                  CalcButton(no: '/', fillColor: 0xFF880E4F, callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    no: '7',
                    fillColor: 0xFF0097A7,
                    callback: btnOnClick,
                  ),
                  CalcButton(no: '8', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '9', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: 'x', fillColor: 0xFF880E4F, callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(no: '4', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '5', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '6', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '-', fillColor: 0xFF880E4F, callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(no: '1', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '2', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '3', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '+', fillColor: 0xFF880E4F, callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(no: '0', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '00', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '000', fillColor: 0xFF0097A7, callback: btnOnClick),
                  CalcButton(no: '=', fillColor: 0xFF880E4F, callback: btnOnClick),
                ],
              ),
            ]))));
  }
}
