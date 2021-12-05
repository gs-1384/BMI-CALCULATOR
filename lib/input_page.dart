import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'Bottom_Button.dart';
import 'RoundIconButton.dart';
import 'Calculator_Brain.dart';

enum GenderType{
  Male,
  Female
}
enum NumberType{
  weightPlus,
  weightMinus,
  agePlus,
  ageMinus
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType myGender;
  NumberType myNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        myGender = GenderType.Male;
                      });
                    },
                    colour: myGender==GenderType.Male ? kActiveCardColor : kInactiveCardColor,
                    cardChild:IconContent(lable: "MALE", icon: FontAwesomeIcons.mars,),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        myGender = GenderType.Female;
                      });
                    },
                    cardChild:IconContent(lable: "FEMALE", icon: FontAwesomeIcons.venus,),
                    colour: myGender==GenderType.Female ? kActiveCardColor : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT",
                    style: kLabelTextStyle,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(height.toString(),
                        style: kNumberTextStyle),
                        SizedBox(width: 2.0,),
                        Text("cm",
                        style:kLabelTextStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double myValue){
                        // print(myValue);
                        setState(() {
                          height = myValue.round();
                        });
                      },
                    ),
                  ],
                ),
              )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onTap: (){
                              setState(() {
                                weight--;
                              });

                            },),
                            SizedBox(width: 15.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onTap: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onTap: (){
                              setState(() {
                                age--;
                              });

                            },
                            ),
                            SizedBox(width: 15.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onTap: (){
                              setState(() {
                                age++;
                              });
                            },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: (){
              CalculatorBrain calc = CalculatorBrain(height1: height, weight1: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  thTextBMI: calc.getTextBMI(),
                  thResultBMI: calc.getCalculateBMI(),
                  thComplimentBMI: calc.getComplimentBMI(),
                )));
            },
            bottomBarText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}




