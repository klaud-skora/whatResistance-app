import '../logic/calculator.dart';

extension UnitExtension on Line {
  static final units = {
    Line.black: 'Ω',
    Line.brown: 'Ω',
    Line.red: 'Ω',
    Line.orange: 'KΩ',
    Line.yellow: 'KΩ',
    Line.green: 'KΩ',
    Line.blue: 'MΩ',
    Line.violet: 'MΩ',
    Line.grey: 'MΩ',
    Line.white: 'GΩ',
    Line.gold: 'Ω',
    Line.silver: 'Ω',
    Line.empty: 'Ω',
  };

  String get unit => units[this];
}