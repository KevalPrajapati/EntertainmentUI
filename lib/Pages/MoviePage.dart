import 'dart:convert';

import 'package:entertainmentui/Helper/HelperFunction.dart';
import 'package:entertainmentui/Models/Models.dart';
import 'package:entertainmentui/Widgets/WidgetHorizontalListWithFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviePage extends StatefulWidget {
  ModelMovieThumbnail movie;

  MoviePage({@required this.movie});
  @override
  _MoviePageState createState() => _MoviePageState(movie);
}

class _MoviePageState extends State<MoviePage> {
  bool isVideoLoading = true;
  ModelMovieThumbnail movie;
  bool userLiked = false;
  _MoviePageState(this.movie);
  int likes;
  List<String> seriesNext;
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: movie.trailerLink,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        // mute: true,
      ),
    );
    getTrending();
    likes = movie.like;
    seriesNext = movie.next;
  }

  List<dynamic> trending = [];
  var data;
  getTrending() async {
    String response = await rootBundle.loadString('assets/Trending.json');
    data = json.decode(response);
    trending =
        (data['trending']).map((i) => ModelMovieThumbnail.fromJson(i)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(child: YoutubePlayer(controller: _controller)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          userLiked ? likes-- : likes++;
                          userLiked = !userLiked;
                        });
                      },
                      icon: Icon(Icons.thumb_up,
                          color: userLiked ? Colors.blue : Colors.white)),
                  Text(likes.toString()),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      HelperFunction.showsSnackBar(
                          "Working on it Buddy :)", context);
                    },
                    icon: Icon(Icons.share, color: Colors.white),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Overview",
                  style: TextStyle(fontSize: 25),
                )),
            Text(
              movie.description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.description,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  "see more",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending",
                  style: TextStyle(),
                ),
              ),
            ),
            WidgetHorizontalListWithFilter(
              list: trending,
            ),
          ],
        ),
      ),
    );
  }
}
