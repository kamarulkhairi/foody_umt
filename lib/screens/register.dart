import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody_umt/components/background.dart';
import 'package:foody_umt/components/rounded-button.dart';
import 'package:foody_umt/components/text-container.dart';
import 'package:foody_umt/components/rounded-passwordfield.dart';
import 'package:foody_umt/screens/home_page.dart';
import 'package:foody_umt/screens/login.dart';
import 'package:foody_umt/components/account-check.dart';
import 'package:foody_umt/components/alert-dialog-message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundLogin(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('REGISTER'),
              SvgPicture.asset(
                'lib/images/register.svg',
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: 'Your Email',
                icon: Icons.person,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedPasswordField(
                onchanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                color: Theme.of(context).accentColor,
                onpressed: () async {
                  try {
                    UserCredential newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (newUser != null) {
                      final FirebaseAuth _auth = FirebaseAuth.instance;
                      User user;
                      if (_auth.currentUser != null) {
                        user = _auth.currentUser;
                        CollectionReference users =
                            FirebaseFirestore.instance.collection('users');
                        users
                            .doc(user.uid)
                            .set({'email': user.email})
                            .then((value) => print('user added'))
                            .catchError(
                                (onError) => print('Failded to add user'));
                      }
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showAlertMessage(context, 'Password is too weak',
                          'Please use a stronger password');
                    } else if (e.code == 'email-already-in-use') {
                      showAlertMessage(context, 'Email already existed',
                          'Please use a different email');
                    } else if (e.code == 'invalid-email') {
                      showAlertMessage(context, 'Email is invalid',
                          'Please check your email format');
                    }
                  } catch (e) {
                    print(e.toString());
                    showAlertMessage(context, '', e.toString());
                  }
                },
                text: 'Sign Up',
                textColor: Colors.white,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              HaveAnAccountCheck(
                login: false,
                pressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
