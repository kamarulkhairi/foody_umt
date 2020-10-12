import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody_umt/components/background.dart';

import 'package:foody_umt/components/rounded-button.dart';
import 'package:foody_umt/components/rounded-passwordfield.dart';
import 'package:foody_umt/components/text-container.dart';
import 'package:foody_umt/screens/home_page.dart';

import 'package:foody_umt/screens/register.dart';
import 'package:foody_umt/components/account-check.dart';
import 'package:foody_umt/components/alert-dialog-message.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                'lib/images/login.svg',
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                hintText: 'Your Email',
                icon: Icons.person,
                onChanged: (value) {
                  email=value;
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedPasswordField(onchanged: (value) {
                password=value;
              }),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                color: Theme.of(context).accentColor,
                onpressed: () async{
                   try {
                    UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    if (userCredential != null) {
                      Navigator.pushNamed(context, HomePage.id);
                    }
                    
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showAlertMessage(context, 'User not found', 'Please create a new account');
                    } else if (e.code == 'wrong-password') {
                      showAlertMessage(context, 'Wrong password', 'Please check your password carefully');
                    }
                  }
                },
                text: 'LOGIN',
                textColor: Colors.white,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              HaveAnAccountCheck(
                login: true,
                pressed: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
