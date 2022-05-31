import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';

class Lyric extends StatefulWidget {
  const Lyric({Key? key}) : super(key: key);

  @override
  State<Lyric> createState() => _LyricState();
}

class _LyricState extends State<Lyric> {
  var song_name;
  var artist_name;
  var album_name;
  var explicit;
  var rating;
  var lyrics;
  var net;
  Future getLyric(String id) async {
    try {
      var url_details = Uri.parse(
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=691d800e807689527268dedd846eb6ff");
      http.Response response = await http.get(url_details);
      Map results = json.decode(response.body);
      var url_lyrics = Uri.parse(
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=691d800e807689527268dedd846eb6ff");
      http.Response response_2 = await http.get(url_lyrics);
      Map results_2 = json.decode(response_2.body);
      print(url_lyrics);
      print(results_2);
      var song = results['message']['body']['track']['track_name'];
      var artist = results['message']['body']['track']['artist_name'];
      var album = results['message']['body']['track']['album_name'];
      var temp = results['message']['body']['track']['track_name'];
      var explicit_in;
      if (temp == 0) {
        explicit_in = "False";
      } else {
        explicit_in = "True";
      }
      var rating_temp = results['message']['body']['track']['track_rating'];
      var lyrics_temp = results_2['message']['body']['lyrics']['lyrics_body'];
      if (mounted) {
        setState(() {
          net = "yes";
          song_name = song;
          artist_name = artist;
          album_name = album;
          explicit = explicit_in;
          rating = rating_temp;
          lyrics = lyrics_temp;
        });
      }
    } on Exception catch (e) {
      print("no net");
      if (mounted) {
        setState(() {
          net = "no";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    print(id.runtimeType);
    print(id.substring(10, 19));
    getLyric(id.substring(10, 19));
    return SafeArea(
        child: net == "yes"
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue[900],
                  title: Text('Music Lyrics Page'),
                  centerTitle: true,
                  elevation: 0,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ListView(children: [
                          ListTile(
                            title: Text(
                              "Name:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$song_name",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Artist:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$artist_name",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Album Name:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$album_name",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Explicit:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$explicit",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Rating:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$rating",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Lyrics:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "$lyrics",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Text(
                "No internet connection",
                style: TextStyle(color: Colors.black12, fontSize: 20),
              )));
  }
}
