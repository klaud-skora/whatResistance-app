
import '../ui/unit_extension.dart';

enum Band {
  first,
  second,
  third,
  fourth,
  fifth
}

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
  silver,
}

extension LineExtention on Line {
  static final numbers = {
    Line.black: 0,
    Line.brown: 1,
    Line.red: 2,
    Line.orange: 3,
    Line.yellow: 4,
    Line.green: 5,
    Line.blue: 6,
    Line.violet: 7,
    Line.grey: 8,
    Line.white: 9,
    Line.gold: -1,
    Line.silver: -1,
  };

  static final multipliers = {
    Line.black: 1.0,
    Line.brown: 10.0,
    Line.red: 100.0,
    Line.orange: 1000.0,
    Line.yellow: 10000.0,
    Line.green: 100000.0,
    Line.blue: 1000000.0,
    Line.violet: 10000000.0,
    Line.grey: 100000000.0,
    Line.white: 1000000000.0,
    Line.gold: 0.1,
    Line.silver: 0.01,
  };

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

  int get number => numbers[this];
  double get multiplier => multipliers[this];
  dynamic get tolerance => tolerances[this];
}

abstract class RawBandResolver {
  int calculateRawResistance(Line first, Line second, Line third, Line fourth, Line fifth);
  double calculateMultiplier(Line first, Line second, Line third, Line fourth, Line fifth);
  dynamic calculateTolerance(Line first, Line second, Line third, Line fourth, Line fifth);
  String getUnit(Line first, Line second, Line third, Line fourth, Line fifth);
  // double adjustTotalToUnit(Line first, Line second, Line third, Line fourth, Line fifth);
}

class FourBandResolver extends RawBandResolver {
  @override
  int calculateRawResistance(Line first, Line second, Line third, Line fourth, Line fifth) {
    if(first.number == -1 || second.number == -1 || third.number == -1) return null;
    return first.number * 10 + second.number;
  }

  @override
  double calculateMultiplier(Line first, Line second, Line third, Line fourth, Line fifth) {
    return third.multiplier;
  }

  @override
  String getUnit(Line first, Line second, Line third, Line fourth, Line fifth) {
    return third.unit;
  }

  @override
  dynamic calculateTolerance(Line first, Line second, Line third, Line fourth, Line fifth) {
    return fifth.tolerance;
  }

}

class FiveBandResolver extends RawBandResolver {
  @override
  int calculateRawResistance(Line first, Line second, Line third, Line fourth, Line fifth) {
    if(first.number == -1 || second.number == -1 || third.number == -1) return null;
    return first.number * 100 + second.number * 10 + third.number;
  }

  @override
  double calculateMultiplier(Line first, Line second, Line third, Line fourth, Line fifth) {
    return fourth.multiplier;
  }

  @override
  String getUnit(Line first, Line second, Line third, Line fourth, Line fifth) {
    return fourth.unit;
  }

  @override
  dynamic calculateTolerance(Line first, Line second, Line third, Line fourth, Line fifth) {
    return fifth.tolerance;
  }
}

class Calculator {
  Line _first = Line.green;
  Line _second = Line.blue;
  Line _third = Line.black;
  Line _fourth = Line.yellow;
  Line _fifth = Line.grey;

  Line get first => _first;
  Line get second => _second;
  Line get third => _third;
  Line get fourth => _fourth;
  Line get fifth => _fifth;

  RawBandResolver _resolver = FiveBandResolver();
  int _bandsCount = 5;

  int get bandsCount => _bandsCount;
  
  setBandsCount(int bandsCount) {
    switch (bandsCount) {
      case 4:
        _bandsCount = 4;
        _resolver = FourBandResolver();
        break;
      case 5:
        _bandsCount = 5;
        _resolver = FiveBandResolver();
        break;
      default:
        throw UnimplementedError();
    }
  }

  setBandValue(Band band, Line value) {
    switch (band) {
      case Band.first:
        _first = value;
        break;
      case Band.second:
        _second = value;
        break;
      case Band.third:
        _third = value;
        break;
      case Band.fourth:
        _fourth = value;
        break;
      case Band.fifth:
        _fifth = value;
        break;
    }
  }

  int get rawResistance {
    return _resolver.calculateRawResistance(_first, _second, _third, _fourth, _fifth);
  }

  double get multiplier {
    return _resolver.calculateMultiplier(_first, _second, _third, _fourth, _fifth);
  }

  double get totalResistance {
    if( rawResistance == null ) return null;
    return rawResistance * multiplier;
  }

  String get resistanceUnit {
    return _resolver.getUnit(_first, _second, _third, _fourth, _fifth);
  }

  dynamic get toleranceInPercentage {
    return _resolver.calculateTolerance(_first, _second, _third, _fourth, _fifth);
  }

  double get adjustTotalToUnit {
    if(totalResistance == null) return null;
    if(resistanceUnit.indexOf('K') != -1 ) return totalResistance / 1000;
    if(resistanceUnit.indexOf('M') != -1 ) return totalResistance / 1000000;
    return totalResistance;
  }
}