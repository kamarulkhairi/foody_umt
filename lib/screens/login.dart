import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody_umt/screens/home_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              password = value;
            },
          ),
          FloatingActionButton(
              child: Text(
                'Login',
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                  if (userCredential != null) {
                    Navigator.pushNamed(context, HomePage.id);
                  }
                } on FirebaseAuthException catch (err) {
                  if (err.code == 'user-not-found') {
                    print('No user found for that email');
                  } else if (err.code == 'wrong-password') {
                    print('Wrong password provided');
                  }
                }
              })
        ],
      ),
    );
  }
}
