import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workin' on it"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            size: 400,
          ),
          Text(
            "Sorry, This is under costruction.\n So is bullet train in India",
          )
        ],
      ),
    );
  }
}
