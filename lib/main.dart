import 'package:entertainmentui/Pages/SplashScreen.dart';
import 'package:entertainmentui/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

bool loggedIn = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Entrement',
        theme: ThemeData(
          backgroundColor: ThemeColors().themeDark,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: ThemeColors().themeDark,
          textTheme: TextTheme(
            body1: GoogleFonts.lato(
              textStyle: TextStyle(color: ThemeColors().themeRed, fontSize: 20),
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
