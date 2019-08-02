import 'package:flutter/material.dart';
import 'drawer.dart';

class WhatupScreen extends StatefulWidget {
  @override
  _WhatupScreenState createState() => _WhatupScreenState();
}

class _WhatupScreenState extends State<WhatupScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Text(
                    "WhatsApp",
                    style: TextStyle(),
                  ),
                ),
                IconButton(
                  onPressed: () => print("object"),
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            indicatorColor: Colors.green,
            tabs: <Widget>[
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
          ),
        ),
        drawer: StyleDrawer(),
        body: TabBarView(
          children: <Widget>[
            BodyTabViewWidget(
              index: currentIndex,
            ),
            BodyTabViewWidget(
              index: currentIndex,
            ),
            BodyTabViewWidget(
              index: currentIndex,
            ),
          ],
        ),
        floatingActionButton: FlexibleFloatingIcon(
          index: currentIndex,
        ),
      ),
    );
  }
}

class BodyTabViewWidget extends StatefulWidget {
  final int index;

  const BodyTabViewWidget({Key key, this.index}) : super(key: key);

  @override
  _BodyTabViewWidgetState createState() => _BodyTabViewWidgetState();
}

class _BodyTabViewWidgetState extends State<BodyTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.index == 0) {
      return ListView(
        children: <Widget>[
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
          EachPrivateChat(),
        ],
      );
    } else {
      return ListView(
        children: <Widget>[
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall(),
          EachPrivateCall()
        ],
      );
    }
  }
}

class EachPrivateChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://lh3.googleusercontent.com/-M6MIFUa3nYs/AAAAAAAAAAI/AAAAAAAAAAA/ACHi3rfH8I8u4RLIyhVM3fr6p8azx6yA9g/mo/photo.jpg?sz=46")),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text("Ke chankrisna"), Text("04/06/2019")],
      ),
      subtitle: Text("I just receied a message from your company that..."),
    );
  }
}

class EachPrivateCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              "https://cdn3.iconfinder.com/data/icons/users-23/64/_Male_Profile_Round_Circle_Users-512.png")),
      title: Text("+85510 46 41 44"),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.subdirectory_arrow_left,
            color: Colors.red,
            size: 12,
          ),
          Text("04/06/2019")
        ],
      ),
      trailing: Icon(Icons.call, color: Colors.green),
    );
  }
}

class FlexibleFloatingIcon extends StatefulWidget {
  final int index;

  const FlexibleFloatingIcon({Key key, this.index}) : super(key: key);
  @override
  _FlexibleFloatingIconState createState() => _FlexibleFloatingIconState();
}

class _FlexibleFloatingIconState extends State<FlexibleFloatingIcon> {
  @override
  Widget build(BuildContext context) {
    switch (this.widget.index) {
      case 0:
        return FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => print("object"),
          child: Icon(Icons.message),
        );
        break;
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.white70,
              onPressed: () => print("object"),
              child: Icon(Icons.edit, color: Colors.black,),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => print("object"),
              child: Icon(Icons.camera_alt),
            )
          ],
        );
        break;
      case 2:
        return FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => print("object"),
          child: Icon(Icons.add_call),
        );
        break;  
      default:
        return FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => print("object"),
          child: Icon(Icons.message),
        );
    }
  }
}
