import 'package:my_app/logic/calculator.dart';
import 'package:test/test.dart';

void main() {
  RawBandResolver testFourBands = FourBandResolver();
  RawBandResolver testFiveBands = FiveBandResolver();

  Calculator testCalc = Calculator();

  Line first = Line.green;
  Line second = Line.blue;
  Line third = Line.black;
  Line fourth = Line.yellow;
  Line fifth = Line.grey;

  test('test case good args for 4 bands', () {
    testCalc.setBandsCount(4);
    
    int rawResistance = testFourBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFourBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFourBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFourBands.calculateTolerance(first, second, third, fourth, fifth);
  
    expect(rawResistance, 56);
    expect(multiplier, 1.0);
    expect(totalResistance, 56.0);
    expect(unit, 'Ω');
    expect(tolerance, 0.05);
    
  });

   test('test case good args for 5 bands', () {
    testCalc.setBandsCount(5);

    int rawResistance = testFiveBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFiveBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFiveBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFiveBands.calculateTolerance(first, second, third, fourth, fifth);

    expect(rawResistance, 560);
    expect(multiplier, 10000.0);
    expect(totalResistance, 5600000.0);
    expect(unit, 'KΩ');
    expect(tolerance, 0.05);
    
  });

  test('test case first == 0 for 4 bands', () {
    testCalc.setBandValue(Band.first, Line.black);
    testCalc.setBandsCount(4);
    first = Line.black;
    
    int rawResistance = testFourBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFourBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFourBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFourBands.calculateTolerance(first, second, third, fourth, fifth);
  
    expect(rawResistance, 6);
    expect(multiplier, 1.0);
    expect(totalResistance, 6.0);
    expect(unit, 'Ω');
    expect(tolerance, 0.05);
    
  });

  test('test case first == 0 for 5 bands', () {
    testCalc.setBandValue(Band.first, Line.black);
    testCalc.setBandsCount(5);
    first = Line.black;
    
    int rawResistance = testFiveBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFiveBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFiveBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFiveBands.calculateTolerance(first, second, third, fourth, fifth);
  
    expect(rawResistance, 60);
    expect(multiplier, 10000.0);
    expect(totalResistance, 600000.0);
    expect(unit, 'KΩ');
    expect(tolerance, 0.05);
    
  });

  test('test case first == 0 for 4 bands', () {
    testCalc.setBandValue(Band.first, Line.gold);
    testCalc.setBandsCount(4);
    first = Line.gold;
    
    int rawResistance = testFourBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFourBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFourBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFourBands.calculateTolerance(first, second, third, fourth, fifth);
  
    expect(rawResistance, null);
    expect(multiplier, 1.0);
    expect(totalResistance, null);
    expect(unit, 'Ω');
    expect(tolerance, 0.05);
    
  });

  test('test case first == 0 for 5 bands', () {
    testCalc.setBandValue(Band.first, Line.gold);
    testCalc.setBandsCount(5);
    first = Line.gold;
    
    int rawResistance = testFiveBands.calculateRawResistance(first, second, third, fourth, fifth);
    double multiplier = testFiveBands.calculateMultiplier(first, second, third, fourth, fifth);
    double totalResistance = testCalc.totalResistance;
    String unit = testFiveBands.getUnit(first, second, third, fourth, fifth);
    dynamic tolerance = testFiveBands.calculateTolerance(first, second, third, fourth, fifth);
  
    expect(rawResistance, null);
    expect(multiplier, 10000.0);
    expect(totalResistance, null);
    expect(unit, 'KΩ');
    expect(tolerance, 0.05);
    
  });
  
}