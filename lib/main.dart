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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int firstnum;
    int secondnum;
    String texttodisplay = "0";
    String res;
    String operatortoperform;

    void btnclicked(String btnval) {
      if (btnval == "C") {
        texttodisplay = "";
        firstnum = 0;
        secondnum = 0;
        res = "0";
        operatortoperform = "";
      } else if (btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/") {
        firstnum = int.parse(texttodisplay);
        res = "";
        operatortoperform = btnval;
      } else if (btnval == "=") {
        secondnum = int.parse(texttodisplay);
        if (operatortoperform == "+") {
          res = (firstnum + secondnum).toString();
        }
        if (operatortoperform == "-") {
          res = (firstnum - secondnum).toString();
        }
        if (operatortoperform == "x") {
          res = (firstnum * secondnum).toString();
        }
        if (operatortoperform == "/") {
          res = (firstnum ~/ secondnum).toString();
        }
      } else {
        res = int.parse(texttodisplay + btnval).toString();
      }
      setState(() {
        texttodisplay = res;
      });
    }

    Widget custombutton(String btnval) {
      return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => btnclicked(btnval),
          child: Text(
            "$btnval",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$texttodisplay",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  custombutton("9"),
                  custombutton("8"),
                  custombutton("7"),
                  custombutton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("6"),
                  custombutton("5"),
                  custombutton("4"),
                  custombutton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("3"),
                  custombutton("2"),
                  custombutton("1"),
                  custombutton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  custombutton("C"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              ),
            ],
          ),
        ),
      );
    }

    throw UnimplementedError();
  }
}
