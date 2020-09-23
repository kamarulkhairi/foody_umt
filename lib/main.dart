import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:foody_umt/home_page.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: MyApp()};

  runApp(
    MaterialApp(
      home: CustomSplash(
        imagePath: 'lib/images/logo_FoodyUmt.png',
        backGroundColor: Color(0xffFFD700),
        animationEffect: 'fade-in',
        logoSize: 200,
        home: MyApp(),
        customFunction: duringSplash,
        duration: 2500,
        type: CustomSplashType.BackgroundProcess,
        outputAndHome: op,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xffFFD700),
          primaryColorBrightness: Brightness.dark,
          accentColor: Color(0xff7A39D9),
          backgroundColor: Color(0xffF9F9E9),
          accentColorBrightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}
