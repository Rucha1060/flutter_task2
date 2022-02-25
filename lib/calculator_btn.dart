import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String no;
  final int fillColor;
  final Function callback;
  const CalcButton({required this.no, required this.fillColor, required this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: SizedBox(
          width: 70,
          height: 70,
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              callback(no);
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0097A7),
                    Color(0xFF880E4F)
                  ],
                ),
              ),

              child: Text(
                no,
                style: TextStyle(fontSize: 25),
              ),
              color: Color(fillColor),
              // textColor: Colors.black)),
            ),
          ),
        ));
  }
}
