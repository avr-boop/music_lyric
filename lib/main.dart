import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_2/Lyric.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Weather(), '/lyrics': (context) => Lyric()},
    debugShowCheckedModeBanner: false,
  ));
}

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var result_network;
  var lst_songnames_1;
  var lst_songnames_2;
  var lst_songnames_3;
  var lst_songnames_4;
  var lst_songnames_5;
  var lst_songnames_6;
  var lst_songnames_7;
  var lst_songnames_8;
  var lst_songnames_9;
  var lst_songnames_10;
  var lst_albumnames_1;
  var lst_albumnames_2;
  var lst_albumnames_3;
  var lst_albumnames_4;
  var lst_albumnames_5;
  var lst_albumnames_6;
  var lst_albumnames_7;
  var lst_albumnames_8;
  var lst_albumnames_9;
  var lst_albumnames_10;
  var lst_authornames_1;
  var lst_authornames_2;
  var lst_authornames_3;
  var lst_authornames_4;
  var lst_authornames_5;
  var lst_authornames_6;
  var lst_authornames_7;
  var lst_authornames_8;
  var lst_authornames_9;
  var lst_authornames_10;
  var net;
  var track_id = [];
  Future getWeather() async {
    var url = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=691d800e807689527268dedd846eb6ff");
    try {
      http.Response response = await http.get(url);
      var lst_songnames_i = [];
      var lst_albumnames_i = [];
      var lst_authornames_i = [];
      var trackid_i = [];
      var results = json.decode(response.body);
      Map res = results;
      for (int i = 0; i < 10; i++) {
        lst_songnames_i.add(
            res['message']['body']['track_list'][i]['track']['track_name']);
        lst_authornames_i.add(
            res['message']['body']['track_list'][i]['track']['artist_name']);
        lst_albumnames_i.add(
            res['message']['body']['track_list'][i]['track']['album_name']);
        trackid_i
            .add(res['message']['body']['track_list'][i]['track']['track_id']);
      }
      var bool_Res = true;
      if (mounted) {
        setState(() {
          lst_songnames_1 = lst_songnames_i[0];
          lst_songnames_2 = lst_songnames_i[1];
          lst_songnames_3 = lst_songnames_i[2];
          lst_songnames_4 = lst_songnames_i[3];
          lst_songnames_5 = lst_songnames_i[4];
          lst_songnames_6 = lst_songnames_i[5];
          lst_songnames_7 = lst_songnames_i[6];
          lst_songnames_8 = lst_songnames_i[7];
          lst_songnames_9 = lst_songnames_i[8];
          lst_songnames_10 = lst_songnames_i[9];
          lst_albumnames_1 = lst_albumnames_i[0];
          lst_albumnames_2 = lst_albumnames_i[1];
          lst_albumnames_3 = lst_albumnames_i[2];
          lst_albumnames_4 = lst_albumnames_i[3];
          lst_albumnames_5 = lst_albumnames_i[4];
          lst_albumnames_6 = lst_albumnames_i[5];
          lst_albumnames_7 = lst_albumnames_i[6];
          lst_albumnames_8 = lst_albumnames_i[7];
          lst_albumnames_9 = lst_albumnames_i[8];
          lst_albumnames_10 = lst_albumnames_i[9];
          lst_authornames_1 = lst_authornames_i[0];
          lst_authornames_2 = lst_authornames_i[1];
          lst_authornames_3 = lst_authornames_i[2];
          lst_authornames_4 = lst_authornames_i[3];
          lst_authornames_5 = lst_authornames_i[4];
          lst_authornames_6 = lst_authornames_i[5];
          lst_authornames_7 = lst_authornames_i[6];
          lst_authornames_8 = lst_authornames_i[7];
          lst_authornames_9 = lst_authornames_i[8];
          lst_authornames_10 = lst_authornames_i[9];
          track_id = trackid_i;
          net = "yes";
        });
      }
    } on Exception catch (e) {
      print("no net");
      if (mounted) {
        setState(() {
          net = "no";
        });
      }
      print(net);
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeather();
    return SafeArea(
        child: net == "yes"
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue[900],
                  title: Text('Music Lyric app by Varun'),
                  centerTitle: true,
                  elevation: 0,
                ),
                body: Column(children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: ListView(children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.music,
                          ),
                          title: Text("$lst_songnames_1"),
                          subtitle: Text("$lst_albumnames_1"),
                          trailing: Text("$lst_authornames_1"),
                          onTap: () {
                            Navigator.pushNamed(context, '/lyrics',
                                arguments: {'trackid': track_id[0]});
                          },
                        ),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_2"),
                            subtitle: Text("$lst_albumnames_2"),
                            trailing: Text("$lst_authornames_2"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[1]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_3"),
                            subtitle: Text("$lst_albumnames_3"),
                            trailing: Text("$lst_authornames_3"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[2]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_4"),
                            subtitle: Text("$lst_albumnames_4"),
                            trailing: Text("$lst_authornames_4"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[3]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_5"),
                            subtitle: Text("$lst_albumnames_5"),
                            trailing: Text("$lst_authornames_5"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[4]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_6"),
                            subtitle: Text("$lst_albumnames_6"),
                            trailing: Text("$lst_authornames_6"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[5]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_7"),
                            subtitle: Text("$lst_albumnames_7"),
                            trailing: Text("$lst_authornames_7"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[6]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_8"),
                            subtitle: Text("$lst_albumnames_8"),
                            trailing: Text("$lst_authornames_8"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[7]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_9"),
                            subtitle: Text("$lst_albumnames_9"),
                            trailing: Text("$lst_authornames_9"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[8]});
                            }),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.music,
                            ),
                            title: Text("$lst_songnames_10"),
                            subtitle: Text("$lst_albumnames_10"),
                            trailing: Text("$lst_authornames_10"),
                            onTap: () {
                              Navigator.pushNamed(context, '/lyrics',
                                  arguments: {'trackid': track_id[9]});
                            }),
                      ),
                    ]),
                  ))
                ]),
              )
            : Center(
                child: Text(
                "No internet connection",
                style: TextStyle(color: Colors.black12, fontSize: 20),
              )));
  }
}
