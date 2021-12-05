import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({@required this.onPressed, @required this.bottomBarText});
  final Function onPressed;
  final String bottomBarText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            bottomBarText,
            style: TextStyle(fontSize: 25.0, letterSpacing: 2.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        // padding: EdgeInsets.only(bottom: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
