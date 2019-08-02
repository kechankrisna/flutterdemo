import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        titleSpacing: 3.0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
                icon: Icon(
                  FontAwesomeIcons.youtube,
                ),
              ),
              Expanded(
                flex: 10,
                child: Text(
                  "Youtube",
                ),
              ),
              IconButton(
                onPressed: () => print("object"),
                icon: Icon(
                  Icons.videocam,
                ),
              ),
              IconButton(
                onPressed: () => print("object"),
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () => print("object"),
                icon: Icon(
                  Icons.supervised_user_circle,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: StyleDrawer(),
      body: BodyReflextionContainer(
        index: bottomIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        type: BottomNavigationBarType
            .fixed, //to display more than 3 icon bottom tab
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('Subscriptions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text('Library'),
          ),
        ],
      ),
    );
  }
}

class BodyReflextionContainer extends StatefulWidget {
  final int index;

  const BodyReflextionContainer({Key key, this.index}) : super(key: key);

  @override
  _BodyReflextionContainerState createState() =>
      _BodyReflextionContainerState();
}

class _BodyReflextionContainerState extends State<BodyReflextionContainer> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.index == 0) {
      return ListView(
        children: <Widget>[
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
        ],
      );
    } else if (this.widget.index == 1) {
      return ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => print("object"),
                        child: Icon(Icons.library_music),
                        backgroundColor: Colors.black87,
                      ),
                      Text("Music")
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => print("object"),
                        child: Icon(Icons.games),
                        backgroundColor: Colors.black87,
                      ),
                      Text("Music")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => print("object"),
                        child: Icon(Icons.new_releases),
                        backgroundColor: Colors.black87,
                      ),
                      Text("News")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => print("object"),
                        child: Icon(Icons.movie_filter),
                        backgroundColor: Colors.black87,
                      ),
                      Text("Music")
                    ],
                  ),
                ),
              ],
            ),
          ),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
          VideoWidget(),
        ],
      );
    } else {
      return Container(
        child: Center(
          child: Text(this.widget.index.toString()),
        ),
      );
    }
  }
}

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Image.network(
              "https://fluttermaster.com/wp-content/uploads/2019/01/fluttermaster.com-working-with-floatingactionbutton-in-flutter.jpg"),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text("The mobile application development channel"),
            subtitle: Text("NAGAAPP Cambodia Channel"),
            trailing: GestureDetector(
              child: Icon(Icons.more_vert),
              onTap: () => print("object"),
            ),
          )
        ],
      ),
    );
  }
}
