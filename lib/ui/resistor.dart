import 'package:flutter/material.dart';
import 'package:my_app/logic/calculator.dart';
import 'color_picker.dart';

class Resistor extends StatefulWidget {
  
  @override
  ResistorState createState() => ResistorState();
}

class ResistorState extends State<Resistor> {
  bool switchOn = false;
  Color first = Color(0xff1b5e20);
  Color second = Color(0xff0d47a1);
  Color third = Color(0xff6d214f);
  Color multiplierColor = Color(0xffffeb3b); 
  Color toleranceColor = Color(0xff9e9e9e);

  changeColor(BuildContext context, stripe, color) async {
    final stripeCol = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorPicker(stripe: stripe)),
    );
    setState(() { 
      if(stripeCol != null) {
        if(color == first) {
          first = stripeCol;
        } else if(color == second) {
          second = stripeCol;
        } else if(color == third) {
          third = stripeCol;
        } else if(color == multiplierColor) {
          multiplierColor = stripeCol;
        } else if(color == toleranceColor) {
          toleranceColor = stripeCol;
        }
      }
    });
 }  

  @override
  Widget build(BuildContext context) {
    Color resistorBackground = Color(0xffBDC581);
    var no3 = switchOn ? third : null;
    var result = getData(first, second, no3, multiplierColor, toleranceColor);
    
    return Container(
      child: Column(
        children: <Widget>[
          Text('Switch for 5-band-code'),
           Switch(
            value: switchOn,
            onChanged: (bool state) { setState(() { switchOn = state; }); },
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
                        color: first,
                        onPressed: () { changeColor(context, 'First', first); },
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
                        color: second,
                        onPressed: () { changeColor(context, 'Second', second); },
                        child: Text(''),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: switchOn ? third : multiplierColor,
                        onPressed: () { changeColor(context, 'Third', switchOn ? third : multiplierColor); },
                        child: Text(''),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    switchOn 
                      ? SizedBox(
                          height: 64.0,
                          width: 10.0,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(),
                            color: switchOn ? multiplierColor : null,
                            onPressed: () { changeColor(context, 'Fourth', multiplierColor); },
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
                    SizedBox(width: 10),
                    SizedBox(
                      height: 64.0,
                      width: 10.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: toleranceColor,
                        onPressed: () { changeColor(context, switchOn ? 'Fifth' : "Fourth", toleranceColor); },
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
          Text(result),
        ],
      ),
    );
  }
}

