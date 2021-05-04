import 'dart:io';

import 'package:entertainmentui/Pages/MoviePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/services.dart';

class WidgetHorizontalList extends StatelessWidget {
  List list;
  WidgetHorizontalList({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviePage(movie: list[i])));
              },
              child: Card(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.network(
                      list[i].imgLink,
                      color: Colors.red.withOpacity(0.10),
                      colorBlendMode: BlendMode.colorDodge,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
