import 'dart:convert';

import 'package:entertainmentui/Helper/HelperFunction.dart';
import 'package:entertainmentui/Models/Models.dart';
import 'package:entertainmentui/Pages/Login.dart';
import 'package:entertainmentui/Pages/UnderConstruction.dart';
import 'package:entertainmentui/Pages/WatchList.dart';
import 'package:entertainmentui/ThemeColors.dart';
import 'package:entertainmentui/Widgets/WidgetHorizontalList.dart';
import 'package:entertainmentui/Widgets/WidgetHorizontalListWithFilter.dart';
import 'package:entertainmentui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool isNewArrivalRunning = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getNewArrivals();
    getrecomendations();
    getWatching();
  }

  var data;
  List<dynamic> newarrivals = [];
  getNewArrivals() async {
    String response = await rootBundle.loadString('assets/NewArrival.json');
    data = json.decode(response);
    newarrivals = (data['newArrival'])
        .map((i) => ModelMovieThumbnail.fromJson(i))
        .toList();
    setState(() {});
  }

  List<dynamic> recomendations = [];
  getrecomendations() async {
    String response = await rootBundle.loadString('assets/Recommended.json');
    data = json.decode(response);
    recomendations = (data['recommended'])
        .map((i) => ModelMovieThumbnail.fromJson(i))
        .toList();
    setState(() {});
  }

  List<dynamic> watching = [];
  getWatching() async {
    String response = await rootBundle.loadString('assets/Watching.json');
    data = json.decode(response);
    watching =
        (data['watching']).map((i) => ModelMovieThumbnail.fromJson(i)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("dtdtdt"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()))
                  .then(
                (value) {
                  setState(() {});
                },
              );
            },
            child: CircleAvatar(
              child: loggedIn ? null : Icon(Icons.person),
              backgroundImage: loggedIn
                  ? NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/C4D03AQH1gbzXg0BEag/profile-displayphoto-shrink_400_400/0/1618246614266?e=1625702400&v=beta&t=sUjdKTeVd1fx7kXi5wpJ7VGYHRYq7l0QIZYcR5UGVzg')
                  : null,
              backgroundColor: ThemeColors().themeLightGrey,
            ),
          )
        ],
        backgroundColor: ThemeColors().themeDark,
      ),
      body: ListView(
        children: [
          Text(
            "New arrivals",
            style: TextStyle(),
          ),
          WidgetHorizontalListWithFilter(
            list: newarrivals,
          ),
          Text(
            "Recommended",
            style: TextStyle(),
          ),
          WidgetHorizontalList(
            list: recomendations,
          ),
          Text(
            "Continue Watching",
            style: TextStyle(),
          ),
          WidgetHorizontalList(
            list: watching,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: Stack(
                children: [
                  loggedIn
                      ? ClipRect(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 0.7,
                            widthFactor: 1,
                            child: Image.network(
                                "https://media-exp1.licdn.com/dms/image/C4D03AQH1gbzXg0BEag/profile-displayphoto-shrink_400_400/0/1618246614266?e=1625702400&v=beta&t=sUjdKTeVd1fx7kXi5wpJ7VGYHRYq7l0QIZYcR5UGVzg"),
                          ),
                        )
                      : Image.network(
                          "https://i.pinimg.com/originals/26/51/2e/26512e8ecc084d5091f5564c154f5df9.jpg"),
                  loggedIn
                      ? ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ThemeColors().themeRed),
                          ),
                          onPressed: () {},
                          child: Text("Log Out"),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                ThemeColors().themeRed),
                          ),
                          child: Text("Login In"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login())).then(
                              (value) {
                                setState(() {});
                              },
                            );
                          }),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("WatchList"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WatchList(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text("Account details"),
              onTap: () {
                Navigator.pop(context);
                HelperFunction.showsSnackBar("Working on it Buddy :)", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Get Premiium"),
              onTap: () {
                Navigator.pop(context);
                HelperFunction.showsSnackBar("Working on it Buddy :)", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UnderConstruction(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UnderConstruction(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
