import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register-page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              email = value;
              print(email);
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
                'Register',
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                try {
                  UserCredential newUser =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  print(newUser);
                  if (newUser != null) {
                    Navigator.pushNamed(context, HomePage.id);
                  }
                } on FirebaseAuthException catch (err) {
                  if (err.code == 'weak-password') {
                    print('password is to weak');
                  } else if (err.code == 'email-already-in-use') {
                    print('account existed');
                  }
                } catch (err) {
                  print(err.toString());
                }
              })
        ],
      ),
    );
  }
}
