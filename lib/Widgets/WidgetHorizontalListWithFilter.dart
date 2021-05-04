import 'package:entertainmentui/Pages/MoviePage.dart';
import 'package:flutter/material.dart';

class WidgetHorizontalListWithFilter extends StatelessWidget {
  List list;
  WidgetHorizontalListWithFilter({this.list});
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
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(list[i].imgLink),
                      height: MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xCC000000),
                            const Color(0x00000000),
                            const Color(0x00000000),
                            const Color(0xCC000000),
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "${list[i].name}",
                        style: TextStyle(color: Colors.white),
                      ),
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
