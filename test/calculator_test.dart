import 'package:test/test.dart';
import '../lib/logic/calculator.dart';

void main() {
  

  test('test case good args', () {
    Calculator testCalc = Calculator(Line.green, Line.blue, Line.empty, Line.yellow, Line.grey);
    int rawResistance = testCalc.rawResistance();
    double multiplier = testCalc.multiplier();
    double totalResistance = testCalc.totalResistance();
    double tolerance = testCalc.toleranceInPercentage();

    expect(rawResistance, 56);
    expect(multiplier, 10.0);
    expect(totalResistance, 560);
    expect(tolerance, 0.05);
  });

  test('test wrong color for line first', () {
    Calculator testFirst = Calculator( Line.gold, Line.blue, Line.empty, Line.yellow, Line.grey);
    int rawResistance1 = testFirst.rawResistance();
    double multiplier1 = testFirst.multiplier();
    double totalResistance1 = testFirst.totalResistance();
    double tolerance = testFirst.toleranceInPercentage();

    expect(rawResistance1, null);
    expect(multiplier1, 10.0);
    expect(totalResistance1, null);
    expect(tolerance, 0.05);
  });

  test('test wrong color for line second', () {
    Calculator testSecond = Calculator( Line.gold, Line.blue, Line.empty, Line.yellow, Line.grey);

    int rawResistance2 = testSecond.rawResistance();
    double multiplier2 = testSecond.multiplier();
    double totalResistance2 = testSecond.totalResistance();
    double tolerance = testSecond.toleranceInPercentage();

    expect(rawResistance2, null);
    expect(multiplier2, 10.0);
    expect(totalResistance2, null);
    expect(tolerance, 0.05);
  });
  test('test wrong color for line third', () {
    Calculator testThird = Calculator( Line.green, Line.blue, Line.gold, Line.yellow, Line.grey);

    int rawResistance3 = testThird.rawResistance();
    double multiplier3 = testThird.multiplier();
    double totalResistance3 = testThird.totalResistance();
    double tolerance = testThird.toleranceInPercentage();

    expect(rawResistance3, null);
    expect(multiplier3, 10.0);
    expect(totalResistance3, null);
    expect(tolerance, 0.05);
  });

  test('test no tolerance', () {
    Calculator testTolerance = Calculator( Line.green, Line.blue, Line.empty, Line.yellow, Line.orange);

    int rawResistance = testTolerance.rawResistance();
    double multiplier = testTolerance.multiplier();
    double totalResistance = testTolerance.totalResistance();
    double tolerance = testTolerance.toleranceInPercentage();

    expect(rawResistance, 56);
    expect(multiplier, 10.0);
    expect(totalResistance, 560);
    expect(tolerance, null);
  });
  
}