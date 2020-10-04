import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody_umt/components/background.dart';
import 'package:foody_umt/components/rounded-button.dart';
import 'package:foody_umt/screens/login.dart';
import 'package:foody_umt/screens/register.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome To FoodyUMT',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            'lib/images/login-welcome.svg',
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            textColor: Colors.white,
            text: 'LOGIN',
            color: Theme.of(context).accentColor,
            onpressed: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedButton(
            color: Color(0xffE8D8FF),
            onpressed: () {
              Navigator.pushNamed(context, RegisterPage.id);
            },
            text: 'SIGN UP',
          )
        ],
      ),
    );
  }
}
