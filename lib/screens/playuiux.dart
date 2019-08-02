import 'package:flutter/material.dart';
import 'drawer.dart';

class PlayUIUXScreen extends StatefulWidget {
  @override
  _PlayUIUXScreenState createState() => _PlayUIUXScreenState();
}

class _PlayUIUXScreenState extends State<PlayUIUXScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                  "PlayUIUX",
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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Play with border radius"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BorderRadiusScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BorderRadiusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BorderRadius Screen"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(150.0, 25.0))),
              child: Text(
                  "BorderRadius.only(bottomRight: Radius.elliptical(150.0, 25.0))"),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(150.0, 25.0))),
              child: Text(
                  "BorderRadius.only(topRight: Radius.elliptical(150.0, 25.0))"),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(150.0, 150.0))),
              child: Text("BorderRadius.all(Radius.elliptical(150.0, 150.0))"),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Text("BorderRadius.circular(50)"),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10),
                      right: Radius.elliptical(100, 50))),
              child: Text(
                  "BorderRadius.horizontal(left: Radius.circular(10), right: Radius.elliptical(100, 50) )"),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.lerp(BorderRadius.circular(5.0),
                      BorderRadius.circular(5.0), 5)),
              child: Text("BorderRadius.circular(50)"),
            ),
            FloatingActionButton(
                onPressed: () => print("object"),
                child: Icon(Icons.add),
                shape: RoundedRectangleBorder()),
            Container(
              margin: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: Border.all(
                      color: Colors.red,
                      width: 8.0,
                    ) +
                    Border.all(
                      color: Colors.green,
                      width: 8.0,
                    ) +
                    Border.all(
                      color: Colors.blue,
                      width: 8.0,
                    ),
              ),
              child: const Text('RGB', textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
