import 'package:flutter/material.dart';
import 'package:my_app/logic/calculator.dart';
import 'color_line_extension.dart';
import 'color_picker.dart';

class Resistor extends StatefulWidget {
  @override
  ResistorState createState() => ResistorState();
}

class ResistorState extends State<Resistor> {
  Calculator resistanceCalculator = Calculator();

  changeColor(BuildContext context, Band band) async {
    final line = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorPicker(band: band)),
    );
    setState(() {
      resistanceCalculator.setBandValue(band, line);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color resistorBackground = Color(0xffBDC581);
    double result = resistanceCalculator.totalResistance;
    if(result != null && resistanceCalculator.resistanceUnit.indexOf('K') != -1 ) result = result / 1000;
    if(result != null && resistanceCalculator.resistanceUnit.indexOf('M') != -1 ) result = result / 1000000;

    String tolerance = resistanceCalculator.toleranceInPercentage == -1 ? '' : '±${resistanceCalculator.toleranceInPercentage}%';
    return Container(
      child: Column(
        children: <Widget>[
          Text('Switch for 5-band-code',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Switch(
            value: resistanceCalculator.bandsCount == 5,
            onChanged: (bool state) {
              setState(() {
                resistanceCalculator.setBandsCount(resistanceCalculator.bandsCount == 5 ? 4 : 5);
              });
            },
            activeColor: Color(0xff58BF9F),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 80.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: resistorBackground,
                ),
                height: 64.0,
                width: 50.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 28),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: resistanceCalculator.first.color,
                        onPressed: () {
                          changeColor(context, Band.first);
                        },
                        child: Text(''),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: resistorBackground),
                height: 55.0,
                width: 80.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: resistanceCalculator.second.color,
                        onPressed: () {
                          changeColor(context, Band.second);
                        },
                        child: Text(''),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: resistanceCalculator.third.color,
                        onPressed: () {
                          changeColor(context, Band.third);
                        },
                        child: Text(''),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    resistanceCalculator.bandsCount == 5
                        ? SizedBox(
                            height: 64.0,
                            width: 10.0,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(),
                              color: resistanceCalculator.fourth.color,
                              onPressed: () {
                                changeColor(context, Band.fourth);
                              },
                              child: Text(''),
                            ),
                          )
                        : SizedBox(width: 10.0),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: resistorBackground,
                ),
                height: 64.0,
                width: 50.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: resistanceCalculator.fifth.color,
                        onPressed: () {
                          changeColor(context, Band.fifth);
                        },
                        child: Text(''),
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Text(result == null ? 'Wrong color picked' : '$result ${resistanceCalculator.resistanceUnit}' +  tolerance),
        ],
      ),
    );
  }
}
