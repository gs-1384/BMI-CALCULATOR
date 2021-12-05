import 'package:flutter/material.dart';




class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onTap});
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(icon),
      elevation: 6.0,
      // disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      // fillColor: Colors.white,
    );
  }
}

