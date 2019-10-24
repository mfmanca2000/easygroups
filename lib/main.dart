import 'package:easygroups/new_theme.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './homepage.dart';

void main() {
  runApp(new MaterialApp(
    home: new Splash(),
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.red,

      fontFamily: 'Montserrat',

      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    routes: {
        NewThemeScreen.routeName: (context) => NewThemeScreen(),
      }
  ));
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Homepage(
          'Easygroups',
        ),
        title: new Text(
          'Benvenuto in Easygroups!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset('assets/images/logo.jpeg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("It works!"),
        loaderColor: Colors.red);
  }
}
