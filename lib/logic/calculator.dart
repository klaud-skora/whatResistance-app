import 'package:flutter/material.dart';
import '../ui/color_line_extension.dart';
import '../ui/tolerance_extension.dart';
import '../ui/unit_extension.dart';

enum Line { 
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  violet,
  grey,
  white,
  gold,
  silver
}

extension LineExtention on Line {

  static final numbers = {
    Line.black: '0',
    Line.brown: '1',
    Line.red: '2',
    Line.orange: '3',
    Line.yellow: '4',
    Line.green: '5',
    Line.blue: '6',
    Line.violet: '7',
    Line.grey: '8',
    Line.white: '9',
    Line.gold: null,
    Line.silver: null,
  };

  static final multipliers = {
    Line.black: 1,
    Line.brown: 10,
    Line.red: 100,
    Line.orange: 1,
    Line.yellow: 10,
    Line.green: 100,
    Line.blue: 1,
    Line.violet: 10,
    Line.grey: 100,
    Line.white: 1,
    Line.gold: 0.1,
    Line.silver: 0.01,
  };

  String get number => numbers[this];
  double get multiplier => multipliers[this];
  
}

getData(Color color, String type) {
  for(Line line in Line.values) {
    if(color == line.color){
      switch(type) {
        case 'number':
          return line.number;
          break;
        case 'unit': 
          return line.unit;
          break;
        case 'multiplier':
          return line.multiplier;
          break;
        case 'tolerance':
          return line.tolerance;
          break;
      }
    }
  }
  return null;
}

String getNumber(String no1, String no2, String no3) {
  return no1 + no2 + no3;
}

String getResistance(n1, n2, n3, multiplier, unit, tolerance) {
  if(n1 == null || n2 == null || n3 == null) return 'Wrong color';
  String numberStr = getNumber(n1, n2, n3);
  int number = int.parse(numberStr); 
  double resistance = number * multiplier;
  String value = resistance.round().toString();
  return value + unit + tolerance;
}