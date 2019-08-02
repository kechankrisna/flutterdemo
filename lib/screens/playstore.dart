import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'drawer.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayStoreScreen extends StatefulWidget {
  @override
  _PlayStoreScreenState createState() => _PlayStoreScreenState();
}

class _PlayStoreScreenState extends State<PlayStoreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double WIDTH = MediaQuery.of(context).size.width;
    final double HEIGHT = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                  Expanded(
                    child: Text(
                      "Playstore",
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
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Padding(child: Text("GAMES"),padding: EdgeInsets.only(right: 20, left: 20),),
                ),
                Tab(
                  child: Padding(child: Text("APPS"),padding: EdgeInsets.only(right: 20, left: 20),),
                ),
                Tab(
                  child: Padding(child: Text("MOVIES"),padding: EdgeInsets.only(right: 20, left: 20),),
                ),
                Tab(
                  child: Padding(child: Text("MUSICS"),padding: EdgeInsets.only(right: 20, left: 20),),
                ),
                Tab(
                  child: Padding(child: Text("CLOUDS"),padding: EdgeInsets.only(right: 20, left: 20),),
                )
              ],
            ),
          ),
          drawer: StyleDrawer(),
          body: TabBarView(
            children: <Widget>[
              GameControllerTabeView(),
              GameControllerTabeView(),
              GameControllerTabeView(),
              GameControllerTabeView(),
              GameControllerTabeView(),
            ],
          )),
    );
  }
}

//tabview
class GameControllerTabeView extends StatefulWidget {
  @override
  _GameControllerTabeViewState createState() => _GameControllerTabeViewState();
}

class _GameControllerTabeViewState extends State<GameControllerTabeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          height: 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TabButtonIcon(
                icon: Transform.rotate(
                  child: Icon(
                    Icons.explore,
                    size: 14,
                  ),
                  angle: 3,
                ),
                label: Text("For you"),
                onPressed: () => print("object"),
              ),
              TabButtonIcon(
                icon: Icon(
                  Icons.insert_chart,
                  size: 14,
                ),
                label: Text("Top Charts"),
                onPressed: () => print("object"),
              ),
              TabButtonIcon(
                icon: Icon(
                  Icons.category,
                  size: 14,
                ),
                label: Text("Categories"),
                onPressed: () => print("object"),
              ),
              TabButtonIcon(
                icon: Icon(
                  Icons.stars,
                  size: 14,
                ),
                label: Text("Editor's Choice"),
                onPressed: () => print("object"),
              ),
              TabButtonIcon(
                icon: Icon(
                  Icons.sentiment_very_satisfied,
                  size: 14,
                ),
                label: Text("Family access"),
                onPressed: () => print("object"),
              ),
              TabButtonIcon(
                icon: Icon(
                  Icons.lock_open,
                  size: 14,
                ),
                label: Text("Eearly access"),
                onPressed: () => print("object"),
              )
            ],
          ),
        ),
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Previously Installed Apps"),
                subtitle: Text("Five one a go"),
                trailing: GestureDetector(child: Text("More", textAlign: TextAlign.right, style: TextStyle(color: Colors.redAccent),),onTap: ()=> print("object"),)
              ),
              AppBlockContainer(),
            ],
          ),
        ),

        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Previously Installed Apps"),
                subtitle: Text("Five one a go"),
                trailing: GestureDetector(child: Text("More", textAlign: TextAlign.right, style: TextStyle(color: Colors.redAccent),),onTap: ()=> print("object"),)
              ),
              AppBlockContainer(),
            ],
          ),
        ),

        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Previously Installed Apps"),
                subtitle: Text("Five one a go"),
                trailing: GestureDetector(child: Text("More", textAlign: TextAlign.right, style: TextStyle(color: Colors.redAccent),),onTap: ()=> print("object"),)
              ),
              AppBlockContainer(),
            ],
          ),
        ),

        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Previously Installed Apps"),
                subtitle: Text("Five one a go"),
                trailing: GestureDetector(child: Text("More", textAlign: TextAlign.right, style: TextStyle(color: Colors.redAccent),),onTap: ()=> print("object"),)
              ),
              AppBlockContainer(),
            ],
          ),
        )
      ],
    );
  }
}

//tabbuttonicon = second tab
class TabButtonIcon extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final VoidCallback onPressed;

  const TabButtonIcon({Key key, this.icon, this.label, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(10.0),
      onPressed: onPressed,
      child: Column(
        children: <Widget>[
          icon,
          SizedBox(
            height: 5.0,
          ),
          label,
        ],
      ),
    );
  }
}

//appblockcontainer which display in block of card
class AppBlockContainer extends StatefulWidget {
  @override
  _AppBlockContainerState createState() => _AppBlockContainerState();
}

class _AppBlockContainerState extends State<AppBlockContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          AppGrid(),
          AppGrid(),
          AppGrid(),
          AppGrid(),
          AppGrid(),
          AppGrid()
        ],
      ),
    );
  }
}

class AppGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.network("https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Facebook_Messenger-512.png"),
          ),
          Text(
            "Messenger - Text and Video",
            softWrap: true,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.verified_user, color: Colors.green, size: 10,),
          )
        ],
      ),
    );
  }
}
