import 'package:entertainmentui/ThemeColors.dart';
import 'package:entertainmentui/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get into your space"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Card(
            color: ThemeColors().themeGrey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeColors().themeLightGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Username",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeColors().themeLightGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // color: ThemeColors().themeLightGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ThemeColors().themeRed),
                        ),
                        onPressed: () {
                          //TODO :Proper Authentication functionality to be used
                          loggedIn = true;
                          Navigator.pop(context);
                        },
                        child: Text("LOGIN"),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
