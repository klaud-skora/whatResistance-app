import 'package:flutter/material.dart';

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
  final int stripe;
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
              children: <Widget>[
                Dot(color: Colors.black),
                Dot(color: Colors.brown),
                Dot(color: Colors.red),
                Dot(color: Colors.orange),
                Dot(color: Colors.yellow),
                Dot(color: Colors.green),
                Dot(color: Colors.blue),
                Dot(color: Color(0xff6D214F)),
                Dot(color: Colors.grey),
                Dot(color: Colors.white),
                Dot(color: Color(0xffEAB543)),
                Dot(color: Colors.grey[600]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
