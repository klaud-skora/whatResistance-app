import '../logic/calculator.dart';

extension ToleranceExtension on Line {

  static final tolerances = {
    Line.black: null,
    Line.brown: 1.0,
    Line.red: 2.0,
    Line.orange: null,
    Line.yellow: null,
    Line.green: 0.5,
    Line.blue: 0.25,
    Line.violet: 0.10,
    Line.grey: 0.05,
    Line.white: null,
    Line.gold: 5.0,
    Line.silver: 0.01,
    Line.empty: null,
  };

  double get tolerance => tolerances[this];  
}