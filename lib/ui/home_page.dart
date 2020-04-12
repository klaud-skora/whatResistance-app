import 'package:flutter/material.dart';
import 'resistor.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WHAT RESISTANCE?'),
        backgroundColor: Color(0xff58BF9F),
      ),
      body: Container(
        color: Color(0xffb8e994),
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
            SizedBox(height: 42.0),
            Text('Choose proper colors relevant to your resistor just right below. Pick them wisely to get preper result. \n\n For no data about chosen color there\'s "Wrong color" statement instead of calculated resistance.'),
            Container(
              padding: const EdgeInsets.only(top: 100.0),
              child: Resistor(),
            ),
          ],
        ),
      ),
    );
  }
}
