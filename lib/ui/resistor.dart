import 'package:flutter/material.dart';
import 'stripe.dart';

class Resistor extends StatefulWidget {
  
  @override
  ResistorState createState() => ResistorState();
}

class ResistorState extends State<Resistor> {

  @override
  Widget build(BuildContext context) {
    var resistorBackground = Color(0xffBDC581);

    return Container(
      child: Row(
        children: <Widget>[          
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: resistorBackground,        
            ),
            height: 44.0,
            width: 30.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 12),
                Stripe(color: Colors.green[900]),
                SizedBox(width: 7.0), 
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: resistorBackground),
            height: 35.0,
            width: 60.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Stripe(color: Colors.deepOrange),
                SizedBox(width: 10.0),
                Stripe(color: Colors.yellow),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: resistorBackground,          
            ),
            height: 44.0,
            width: 30.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Stripe(color: Colors.blue[700]),
                SizedBox(width: 10.0), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

