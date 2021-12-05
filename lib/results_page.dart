import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Bottom_Button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.thResultBMI, @required this.thTextBMI, @required this.thComplimentBMI});
  final thTextBMI;
  final thResultBMI;
  final thComplimentBMI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: kResultTextStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    thTextBMI,
                    style: kResultWord,
                  ),
                  Text(
                    thResultBMI,
                    style: kBMIResultStyle,
                  ),
                  Text(
                    thComplimentBMI,
                    textAlign: TextAlign.center,
                    style: kComplimentText,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            bottomBarText: 'Re-CALCULATE',
          ),
        ],
      ),
    );
  }
}
