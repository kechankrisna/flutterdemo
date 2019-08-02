import 'package:flutter/material.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                borderRadius: BorderRadius.all(Radius.circular(3.5)), color: Colors.white),
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
                    "Homepage",
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
      );
  }
}