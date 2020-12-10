import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _BmiResult = 0.0;
  String _FormattedText = "";

  void handleText(int value) {
    if (_BmiResult <= 18.5){
      value =1;
    }
    else if (_BmiResult<= 25.0 ) {
      value =2;
    }else {
      value = 3;
    }

    setState(() {
      switch (value) {
        case 1:
          _FormattedText =
              "You have a lower than normal body weight. You can eat a bit more";
          break;
        case 2:
          _FormattedText = "You have a normal body weight, Nice job!";
          break;
        case 3:
          _FormattedText =
              "You have higher than a normal body weight.Try to exercise more.";
          break;
      }
    });
  }

  double CalculateBmi(String weight, String height) {
    if (double.parse(weight).toString().isNotEmpty && double.parse(weight) > 0) {
      if (double.parse(height).toString().isNotEmpty &&
          double.parse(height) > 0) {
        double result = (double.parse(weight) /
            (double.parse(height) / 0.0328) /
            (double.parse(height) / 0.0328) *
            10000);
        return result;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: ListView(
//        padding: EdgeInsets.all(20),
        children: <Widget>[
          Center(child: Image.asset('images/bmi.png')),
          Center(
            child: Text(
              'Body Mass Index Calculator',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Color(0xAAAB47BC),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Enter Your Height',
                    hintText: 'In Feets',
                    icon: Image.asset(
                      "images/height.png",
                      scale: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Enter Your Weight',
                    hintText: 'In Kgs',
                    icon: Image.asset(
                      "images/weight.png",
                      scale: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _BmiResult = CalculateBmi(
                          _weightController.text, _heightController.text);
                      handleText(1);
                    });
                  },
                  color: Colors.purpleAccent,
                  child: Text('Calculate'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your Bmi : ${_BmiResult.toStringAsFixed(1)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$_FormattedText',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
