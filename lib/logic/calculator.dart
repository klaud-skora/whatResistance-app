import 'package:flutter/material.dart';

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

  static final colors = {
    Line.black: Color(0xff000000),
    Line.brown: Color(0xff795548),
    Line.red: Color(0xfff44336),
    Line.orange: Color(0xffff9800),
    Line.yellow: Color(0xffffeb3b),
    Line.green: Color(0xff1b5e20),
    Line.blue: Color(0xff0d47a1),
    Line.violet: Color(0xff6d214f),
    Line.grey: Color(0xff9e9e9e),
    Line.white: Color(0xffffffff),
    Line.gold: Color(0xffeab543),
    Line.silver: Color(0xff757575),
  };

  static final numbers = {
    Line.black: '',
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
    Line.grey: null,
    Line.white: null,
    Line.gold: null,
    Line.silver: null,
  };

  static final units = {
    Line.black: 'Ω',
    Line.brown: 'Ω',
    Line.red: 'Ω',
    Line.orange: 'KΩ',
    Line.yellow: 'KΩ',
    Line.green: 'KΩ',
    Line.blue: 'MΩ',
    Line.violet: 'MΩ',
    Line.grey: null,
    Line.white: null,
    Line.gold: null,
    Line.silver: null,
  };

  static final tolerances = {
    Line.black: '',
    Line.brown: '±1%',
    Line.red: '±2%',
    Line.orange: '',
    Line.yellow: '',
    Line.green: '±0.5%',
    Line.blue: '±0.25%',
    Line.violet: '±0.10%',
    Line.grey: '±0.05%',
    Line.white: '',
    Line.gold: '±5%',
    Line.silver: '±10%',
  };

  String get number => numbers[this];
  int get multiplier => multipliers[this];
  String get unit => units[this];
  String get tolerance => tolerances[this];
  Color get color => colors[this];

}

String getData(first, second, third, multiplier, tolerance) {
  String no1, no2, no3, unit, toler;
  int multer;
  for(Line line in Line.values) {
    if(third == null) no3 = '';
    else if(line.color == third) no3 = line.number;

    if(line.color == first) no1 =  line.number;
    if(line.color == second) no2 = line.number;
    if(line.color == multiplier) {
      multer = line.multiplier;
      unit = line.unit;
    }
    if(line.color == tolerance) toler = line.tolerance;
  }
  if(no1 == null || no2 == null || no3 == null || multer == null) return 'Wrong color';

  var resistance = int.parse(no1 + no2 + no3) * multer;
  
  return '${resistance.toString()}$unit $toler';
}
