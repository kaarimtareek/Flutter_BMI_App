import 'package:flutter/material.dart';
import 'package:bmi_app/logic/bmi_logic.dart';

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: new Text("BMI Calculator",
          textDirection: TextDirection.ltr,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            ),
          ),
        ),
        body: Container(
            color: Colors.white54,
            child: ListView(
              children: <Widget>[
                Column(
                children:<Widget>[  
                  BmiLogic(),

                ]
                )
              ],
            ),
        ),
      ),
    );
  }
}