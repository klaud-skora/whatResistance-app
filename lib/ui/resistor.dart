import 'package:flutter/material.dart';
import 'stripe.dart';

class Resistor extends StatefulWidget {
  
  @override
  ResistorState createState() => ResistorState();
}

class ResistorState extends State<Resistor> {
  bool switchOn = false;

  @override
  Widget build(BuildContext context) {
    var resistorBackground = Color(0xffBDC581);
    print(switchOn);
    return Container(
      child: Column(
        children: <Widget>[
          Text('Swicth for 5-band-code'),
           Switch(
            value: switchOn,
            onChanged: (bool state) {
              setState(() { switchOn = state; });
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
                    Stripe(stripe: 1, color: Colors.green[900]),
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
                    Stripe(stripe: 2, color: Colors.deepOrange),
                    SizedBox(width: 10.0),
                    Stripe(stripe: 3, color: Colors.yellow),
                    SizedBox(width: 15.0),
                    switchOn ? Stripe(stripe: 4, color: Colors.pink) : SizedBox(width: 10.0),
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
                    Stripe(stripe: switchOn ? 5 : 4, color: Colors.blue[700]),
                    SizedBox(width: 10.0), 
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

