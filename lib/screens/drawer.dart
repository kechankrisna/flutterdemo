import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StyleDrawer extends StatefulWidget {
  @override
  _StyleDrawerState createState() => _StyleDrawerState();
}

class _StyleDrawerState extends State<StyleDrawer> {
  List<Item> _items = [
    Item(id: 1, title: "Sub category 1"),
    Item(id: 2, title: "Sub category 2"),
    Item(id: 3, title: "Sub category 3"),
    Item(id: 4, title: "Sub category 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: ListView.builder(
        itemCount: this._items.length + 2,
        itemBuilder: (BuildContext builder, int id) {
          return id == 0
              ? UserAccountsDrawerHeader(
                  currentAccountPicture: Icon(
                    Icons.supervised_user_circle,
                    size: 60,
                    color: Colors.white,
                  ),
                  accountName: Text("Ke Chankrisna"),
                  accountEmail: Text("info@nagaapp.com"),
                  otherAccountsPictures: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.satellite,
                        color: Colors.white,
                      ),
                      onPressed: () => print("object"),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.schedule,
                        color: Colors.white,
                      ),
                      onPressed: () => print("object"),
                    ),
                  ],
                )
              : id < this._items.length + 1
                  ? ListTile(
                      onTap: () => print(this._items[id - 1].title),
                      title: Text(this._items[id - 1].title),
                      leading: Text(this._items[id - 1].id.toString()),
                    )
                  : Column(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Home"),
                            onTap: () => Navigator.of(context).pushNamed('/')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.mapMarkerAlt),
                            title: Text("Map"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/map')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.googlePlay),
                            title: Text("Playstore"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/playstore')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.youtube),
                            title: Text("Youtube"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/youtube')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.whatsapp),
                            title: Text("Whatup"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/whatup')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.chrome),
                            title: Text("Google Chrome"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/chrome')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.angellist),
                            title: Text("Animation Container"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/animate')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.handPaper),
                            title: Text("PlayUIUX"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/playuiux')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.camera),
                            title: Text("Image Picker"),
                            onTap: () => Navigator.of(context)
                                .pushNamed('/imagepicker')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.globe),
                            title: Text("Web View"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/webview')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.youtubeSquare),
                            title: Text("Youtube Player"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/yplayer')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.lightbulb),
                            title: Text("Open flash with lamp"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/flash')),
                        ListTile(
                            leading: Icon(FontAwesomeIcons.shareAlt),
                            title: Text("Scoped Model"),
                            onTap: () =>
                                Navigator.of(context).pushNamed('/scoped')),
                      ],
                    );
        },
      ),
    )
        // child: ListView(

        //   children: <Widget>[
        //     UserAccountsDrawerHeader(
        //       currentAccountPicture: Icon(
        //         Icons.supervised_user_circle,
        //         size: 60,
        //         color: Colors.white,
        //       ),
        //       accountName: Text("Ke Chankrisna"),
        //       accountEmail: Text("info@nagaapp.com"),
        //       otherAccountsPictures: <Widget>[
        //         IconButton(
        //           icon: Icon(
        //             Icons.satellite,
        //             color: Colors.white,
        //           ),
        //           onPressed: () => print("object"),
        //         ),
        //         IconButton(
        //           icon: Icon(
        //             Icons.schedule,
        //             color: Colors.white,
        //           ),
        //           onPressed: () => print("object"),
        //         ),
        //       ],
        //     ),
        //     ListTile(
        //         leading: Icon(Icons.home),
        //         title: Text("Home"),
        //         onTap: () => Navigator.of(context).pushNamed('/')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.mapMarkerAlt),
        //         title: Text("Map"),
        //         onTap: () => Navigator.of(context).pushNamed('/map')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.googlePlay),
        //         title: Text("Playstore"),
        //         onTap: () => Navigator.of(context).pushNamed('/playstore')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.youtube),
        //         title: Text("Youtube"),
        //         onTap: () => Navigator.of(context).pushNamed('/youtube')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.whatsapp),
        //         title: Text("Whatup"),
        //         onTap: () => Navigator.of(context).pushNamed('/whatup')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.chrome),
        //         title: Text("Google Chrome"),
        //         onTap: () => Navigator.of(context).pushNamed('/chrome')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.angellist),
        //         title: Text("Animation Container"),
        //         onTap: () => Navigator.of(context).pushNamed('/animate')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.handPaper),
        //         title: Text("PlayUIUX"),
        //         onTap: () => Navigator.of(context).pushNamed('/playuiux')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.camera),
        //         title: Text("Image Picker"),
        //         onTap: () => Navigator.of(context).pushNamed('/imagepicker')),
        //     ListTile(
        //         leading: Icon(FontAwesomeIcons.globe),
        //         title: Text("Web View"),
        //         onTap: () => Navigator.of(context).pushNamed('/webview')),

        //   ],
        // ),
        );
  }
}

class Item {
  final int id;
  final String title;
  Item({this.id, this.title});
}
