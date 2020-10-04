import 'package:flutter/material.dart';

class HaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function pressed;
  HaveAnAccountCheck({@required this.login, @required this.pressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Dont have an account? ' : 'Already have an account? ',
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: pressed,
          child: Text(
            login ? 'Sign Up' : 'Sign in',
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        )
      ],
    );
  }
}
