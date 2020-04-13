import 'package:flutter/material.dart';

import '../logic/calculator.dart';

extension ColorLineExtension on Line {

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

  Color get color => colors[this];
 }