import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChromeScreen extends StatefulWidget {
  @override
  _ChromeScreenState createState() => _ChromeScreenState();
}

class _ChromeScreenState extends State<ChromeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool endDrawerTicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 3.0,
        title: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => print("object"),
            icon: Container(
              alignment: Alignment.center,
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0)),
              child: Text("12", style: TextStyle(color: Colors.grey)),
            ),
          ),
          IconButton(
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: StyleDrawer(),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.rotate_right),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text("New Tab"),
            ),
            ListTile(
              title: Text("New incognito Tab"),
            ),
            ListTile(
              title: Text("Bookmarks"),
            ),
            ListTile(
              title: Text("Recent Tabs"),
            ),
            ListTile(
              title: Text("History"),
            ),
            ListTile(
              title: Text("Downloads"),
            ),
            ListTile(
              title: Text("Desktop Site"),
              trailing: IconButton(
                onPressed: () {
                  setState((){
                    endDrawerTicked = !endDrawerTicked;
                  });
                },
                icon: Container(
                  alignment: Alignment.center,
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0)),
                  child: endDrawerTicked == true ? Icon(FontAwesomeIcons.check, size: 12,) : Text(""),
                  ),
                ),
              ),
            ListTile(
              title: Text("Settings"),
            ),
            ListTile(
              title: Text("Help & Feedback"),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.network(
              "https://www.google.com.kh/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png",
              scale: 1.5,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    hintText: "Search or type web address",
                    fillColor: Colors.black12,
                    suffixIcon: Icon(Icons.keyboard_voice)),
              ),
            ),
            BookmarkWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text("Article for you"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text("Hide", style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            ArticleContainerWidget(),
          ],
        ),
      ),
    );
  }
}

class BookmarkWidget extends StatefulWidget {
  @override
  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
          ),
          title: Text("Faceboook"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.youtube,
            color: Colors.red,
          ),
          title: Text("Youtube"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.google,
            color: Colors.green,
          ),
          title: Text("Google"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.tripadvisor,
            color: Colors.lightGreen,
          ),
          title: Text("Tripadvisor"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.googleDrive,
            color: Colors.blueGrey,
          ),
          title: Text("Google Drive"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.yelp,
            color: Colors.orange,
          ),
          title: Text("Advertise"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.alipay,
            color: Colors.deepOrange,
          ),
          title: Text("Alipay"),
          onpress: () => print("object"),
        ),
        TextIconButton(
          icon: Icon(
            FontAwesomeIcons.facebookMessenger,
            color: Colors.blueAccent,
          ),
          title: Text("Messager"),
          onpress: () => print("object"),
        ),
      ],
    );
  }
}

class TextIconButton extends StatelessWidget {
  final Widget title, icon;
  final VoidCallback onpress;

  const TextIconButton({Key key, this.title, this.icon, this.onpress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: RawMaterialButton(
        onPressed: onpress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black12,
              child: icon,
            ),
            title,
          ],
        ),
      ),
    );
  }
}

class ArticleContainerWidget extends StatefulWidget {
  @override
  _ArticleContainerWidgetState createState() => _ArticleContainerWidgetState();
}

class _ArticleContainerWidgetState extends State<ArticleContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Article(),
        Article(),
        Article(),
        Article(),
        Article(),
        Article(),
        Article(),
      ],
    );
  }
}

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ClipRect(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: ListTile(
                title: Text(
                    "This is the google chrome article, This is the google"),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.ac_unit,
                      size: 14,
                    ),
                    Text("Khmer - readers news"),
                    Icon(
                      Icons.verified_user,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.network(
                  "https://images.ctfassets.net/1es3ne0caaid/2xAuWSE2MIGKySyku2M68C/ae045c5b1ec0f5d3f40eb73aeeca8b4a/flutter-layouts-16.png"),
            )
          ],
        ),
      ),
    );
  }
}
