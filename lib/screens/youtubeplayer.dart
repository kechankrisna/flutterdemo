import 'package:flutter/material.dart';
import 'drawer.dart';

import 'package:youtube_player/youtube_player.dart';

class YoutubePlayerScreen extends StatefulWidget {
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _idController = TextEditingController();
  String id = "mzOwopa-d-0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 3.0,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.5)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
              ),
              Container(
                child: Text(
                  "Youtube Player",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => print("object"),
                icon: Icon(
                  Icons.keyboard_voice,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: StyleDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YoutubePlayer(
              context: context,
              source: id,
              quality: YoutubeQuality.HIGH,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter youtube \<video id\> or \<link\>"),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  id = _idController.text;
                });
              },
              child: Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
