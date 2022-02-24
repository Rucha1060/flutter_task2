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
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void btnOnClick(no) {
    if (no == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && no == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (no == '+' || no == '-' || no == 'x' || no == '/' || no == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = no;
      result = '';
    } else if (no == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (no == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (no == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1) : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + no;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) return result = splitDecimal[0].toString();
    }
    return result;

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
                      result,
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      finalResult,
                      style: TextStyle(color: Colors.black, fontSize: 50),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(no: 'AC', fillColor: 0xFF880E4F, callback: btnOnClick),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
