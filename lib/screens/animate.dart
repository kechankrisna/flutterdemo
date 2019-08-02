import 'package:flutter/material.dart';
import 'drawer.dart';

class AnimateScreen extends StatefulWidget {
  @override
  _AnimateScreenState createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
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
                  "Animatepage",
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
         OpacityAnimateWidget(show: true,duration: Duration(minutes: 2),),
         ColorAnimateWidget(fromColor: Color.fromARGB(1, 1, 1, 1,), toColor: Color.fromRGBO(1, 122, 44, 0.4), duration: Duration(seconds: 5),)
        ],
      ),
    );
  }
}

class OpacityAnimateWidget extends StatefulWidget {
  final bool show;
  final Duration duration;

  OpacityAnimateWidget({Key key, this.show, this.duration}) : super(key: key);
 
  @override
  _OpacityAnimateWidgetState createState() => _OpacityAnimateWidgetState();
}

class _OpacityAnimateWidgetState extends State<OpacityAnimateWidget> {

  bool _show;
  Duration _duration;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _show= this.widget.show;
    _duration = this.widget.duration;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.linear,
      child: Opacity(
        opacity: _show ? 1 : 0,
        
        child: Center(
          child: RaisedButton.icon(
            label: Text("Press to hide or show me"),
            icon: Icon(Icons.slideshow),
            onPressed: () {
              setState(() {
                _show = !_show;
              });
            },
          ),
        ),
      ),
    );
  }
}



class ColorAnimateWidget extends StatefulWidget {

  final Color fromColor, toColor;
  final Duration duration;

  const ColorAnimateWidget({Key key, this.fromColor, this.toColor, this.duration}) : super(key: key);

  @override
  _ColorAnimateWidgetState createState() => _ColorAnimateWidgetState();
}

class _ColorAnimateWidgetState extends State<ColorAnimateWidget> {

  Duration _duration;
  Color _fromColor, _toColor;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _duration = this.widget.duration;
    _fromColor = this.widget.fromColor;
    _toColor = this.widget.toColor;
  }

  _stateChangeColor(){
    setState(() {
      _fromColor = _toColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.linear,
      color: _fromColor,
        child: Center(
          child: RaisedButton.icon(
            label: Text("Press to change color"),
            icon: Icon(Icons.slideshow),
            onPressed: _stateChangeColor,
          ),
      ),
    );
  }
}