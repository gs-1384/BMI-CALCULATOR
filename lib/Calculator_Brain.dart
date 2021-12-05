import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain{
  CalculatorBrain({@required this.height1, @required this.weight1});
  final height1;
  final weight1;
  double _bmi;

  String getCalculateBMI(){
    _bmi = weight1/pow(height1/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTextBMI(){
    _bmi = weight1/pow(height1/100, 2);
    if(_bmi >= 25){
      return 'OVER-WEIGHT';
    }
    else if(_bmi > 18.5){
      return 'NORMAL';
    }
    else{
      return 'UNDER-WEIGHT';
    }
  }

  String getComplimentBMI(){
    _bmi = weight1/pow(height1/100, 2);
    if(_bmi >= 25){
      return 'Thoda kam khao or GYM jao beta...';
    }
    else if(_bmi>18.5){
      return 'Nice..., maintain it!! ';
    }
    else{
      return 'Jyada khao betaa, jo mile vo khao...';
    }
  }
}

