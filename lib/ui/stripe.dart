import 'package:flutter/material.dart';

class Stripe extends StatelessWidget {

  Stripe({this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      width: 6.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(),
        color: color,
        onPressed: () {},
        child: Text(''),
      ),
    );
  }
}

