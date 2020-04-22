import 'package:my_app/logic/calculator.dart';

extension ToleranceExtension on Line {
  static final tolerances = {
    Line.black: -1,
    Line.brown: 1,
    Line.red: 2,
    Line.orange: -1,
    Line.yellow: -1,
    Line.green: 0.5,
    Line.blue: 0.25,
    Line.violet: 0.10,
    Line.grey: 0.05,
    Line.white: -1,
    Line.gold: 5,
    Line.silver: 0.01,
  };

  double get tolerance => tolerances[this];
}
