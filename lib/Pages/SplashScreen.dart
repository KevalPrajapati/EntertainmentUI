import 'dart:async';

import 'package:entertainmentui/Pages/HomePage.dart';
import 'package:entertainmentui/ThemeColors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer _timer = new Timer(Duration(milliseconds: 200), () {
      setState(() {
        // position = MediaQuery.of(context).size.width / 2 - 50;
        size = 80;
        Timer exitTimer = new Timer(Duration(milliseconds: 400), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        });
      });
    });
  }

  double position = 50;
  double size = 10;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: AnimatedPositioned(
                  left: position,
                  duration: Duration(milliseconds: 400),
                  child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: TextStyle(
                          fontSize: size, color: ThemeColors().themeRed),
                      child: Text("Entrement"))),
            ),
          ],
        ),
      ),
    );
  }
}
