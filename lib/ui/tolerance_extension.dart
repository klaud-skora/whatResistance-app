import '../logic/calculator.dart';

extension ToleranceExtension on Line {

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
    Line.silver: '±0.01%',
  };

  String get tolerance => tolerances[this];  
}