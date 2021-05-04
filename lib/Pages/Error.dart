import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 400,
          ),
          Text(
            "Sorry, I did something wrong there \n You can kill me",
          )
        ],
      ),
    );
  }
}
