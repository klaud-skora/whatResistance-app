import 'package:flutter/material.dart';
import 'package:my_app/logic/calculator.dart';

class Dot extends StatelessWidget {

  final Color color;
  Dot({this.color});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,
      height: 50,
      child: FlatButton(
        shape: CircleBorder(),
        color: color,
        onPressed: () { Navigator.pop(context, color); },
        child: Text(''),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final String stripe;
  ColorPicker({this.stripe});
  
  @override
  Widget build(BuildContext context) { 
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a color'),
        backgroundColor: Color(0xff58BF9F),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 200.0),
        width: size.width,
        color: Color(0xfff1f2f6),
        child: Column(
          children: <Widget>[
            Text('Stripe $stripe', style: TextStyle(fontSize: 30.0)),
            SizedBox(height: 30.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0, 
              children: [
                for(Line line in Line.values) Dot(color: line.color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
