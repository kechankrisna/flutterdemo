import 'dart:async';
import 'drawer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  TextEditingController _textEditingController;
  String _url = 'https://www.google.com';


  void _nChangeValue(String url) {
    setState(() {
      _url = url;
    });
  }

  Future<void> _onloadUrl() async {
    try {
      if (await canLaunch(this._url)) {
        //await launch(this._url);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScaffold(
              initialUrl: this._url,
            ),
          )
        );
      } else {
        throw 'Could not launch ${this._url}';
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
      ),
      drawer: StyleDrawer(),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            onChanged: _nChangeValue,
          ),
          RaisedButton(
            onPressed: _onloadUrl,
            child: Text("Search"),
          )
        ],
      ),
    );
  }
}

class WebViewScaffold extends StatefulWidget {
  final String initialUrl;

  const WebViewScaffold({Key key, this.initialUrl}) : super(key: key);
  @override
  _WebViewScaffoldState createState() => _WebViewScaffoldState();
}

class _WebViewScaffoldState extends State<WebViewScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
      ),
      drawer: StyleDrawer(),
      body: WebView(
        initialUrl: this.widget.initialUrl,
        onWebViewCreated: (WebViewController controller){
          print(controller.currentUrl());
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}