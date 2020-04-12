import 'package:flutter/material.dart';
import 'color_picker.dart';

 class Stripe extends StatefulWidget {
  Stripe({this.stripe, this.color});
  final Color color;
  final int stripe;
  
  StripeState createState() => StripeState();
 }

class StripeState extends State<Stripe> {
  var dotColor;
  changeColor(BuildContext context, stripe) async {
    final stripeCol = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ColorPicker(stripe: stripe)),
    );
    setState(() { dotColor = stripeCol; });
 }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      width: 6.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(),
        color: dotColor == null ? widget.color : dotColor,
        onPressed: () {changeColor(context, widget.stripe); },
        child: Text(''),
      ),
    );
  }
}
