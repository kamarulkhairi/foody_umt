import 'package:flutter/material.dart';
import 'package:foody_umt/components/text-container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onchanged;
   RoundedPasswordField({@required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Theme.of(context).accentColor,
            ),
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.visibility,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
