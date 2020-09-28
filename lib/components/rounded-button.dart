import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  final Color color;
  final Color textColor;
  RoundedButton(
      {@required this.color, @required this.onpressed, @required this.text,this.textColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
        elevation: 0,
        color: color,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}