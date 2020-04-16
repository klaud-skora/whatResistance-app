import '../ui/color_line_extension.dart';
import '../ui/tolerance_extension.dart';

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
    Line.gold: '',
    Line.silver: '',
  };

  static final multipliers = {
    Line.black: 1.0,
    Line.brown: 10.0,
    Line.red: 100.0,
    Line.orange: 1.0,
    Line.yellow: 10.0,
    Line.green: 100.0,
    Line.blue: 1.0,
    Line.violet: 10.0,
    Line.grey: 100.0,
    Line.white: 1.0,
    Line.gold: 0.1,
    Line.silver: 0.01,
  };

  String get number => numbers[this];
  double get multiplier => multipliers[this];
  
}

class Calculator {

  Line first = Line.green;
  Line second = Line.blue;
  Line third = Line.black;
  Line multiplier = Line.yellow;
  Line tolerance = Line.grey;

  Calculator(this.first, this.second, this.third, this.multiplier, this.tolerance);

  int rawResistance() {
    return int.parse(first.number + second.number + third.number); 
  }
  
  double totalResistance() {
    return ((rawResistance() * multiplier.multiplier) * 100).round() / 100;
  }
  
  String toleranceInPercentage() {
    return tolerance.tolerance;
  }
}

Line getLine(color) {
  for(Line line in Line.values) {
    if(line.color == color) return line;
  }
  return null;
}