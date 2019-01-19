import 'package:flutter/material.dart';

class BmiLogic extends StatefulWidget {
  _BmiState createState() => _BmiState();
}
//check if the input is number or not
 bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

class _BmiState extends State<BmiLogic> {
  final TextEditingController _ageFieldController = new TextEditingController();
  final TextEditingController _heightFieldController =
      new TextEditingController();
  final TextEditingController _weightFieldController =
      new TextEditingController();

  String _indicationOfCalculation = '';
  double result = 0;
  void handleCalculation(String age, String height, String weight) {
    setState(() {
        if (!(_isNumeric(age)&& _isNumeric(height)&&_isNumeric(weight)))
        {
          _indicationOfCalculation = 'Invalid Input';
        }
        else{
        double iAge = double.parse(age);
        double iHeight = double.parse(height);
        double iWeight = double.parse(weight);
        double feetToInch = iHeight * 12;
        result = (iWeight / (feetToInch * feetToInch)) * 703;
        if (result < 18.5) {
          _indicationOfCalculation = 'Your BMI is $result : Under Weight';
        } else if (result <= 23) {
          _indicationOfCalculation = 'Your BMI is $result : Normal Weight';
        } else if (result <= 25) {
          _indicationOfCalculation = 'Your BMI is $result : Over Weight';
        } else {
          _indicationOfCalculation = 'Your BMI is $result : Obese Weight';
        }
        }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _ageFieldController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Age',
              hintText: 'Enter your Age',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _heightFieldController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              
              labelText: 'Height',
              hintText: 'Enter your Height in feet',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _weightFieldController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight',
              hintText: 'Enter your Weight in lb',
              icon: Icon(Icons.person),
            ),
          ),
          RaisedButton(
            onPressed: (){handleCalculation(_ageFieldController.text,_heightFieldController.text,_weightFieldController.text);},
            color: Colors.redAccent,
            child: Text(
              'Calculate',
              textDirection: TextDirection.ltr,
            ),
          ),
          Text(
            _indicationOfCalculation,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}
