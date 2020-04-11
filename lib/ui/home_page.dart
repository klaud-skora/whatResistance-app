import 'package:flutter/material.dart';
import 'resistor.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('WHAT RESISTANCE?'),
        backgroundColor: Color(0xff58BF9F),
      ),
      body: Container(
        color: Color(0xff7bff9f),
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Calculate resistace of your resistor!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 12.0),
            Text('Choose proper colors relevant to your resistor right below'),
            Container(
              padding: const EdgeInsets.only(top: 60.0, left: 90.0),
              child: Resistor(),
            ),
          ],
        ),
      ),
    );
  }
}
