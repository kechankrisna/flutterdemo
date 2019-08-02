import 'package:flutter/foundation.dart'
show debugDefaultTargetPlatformOverride; // for desktop embedder

import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/map.dart';
import 'screens/playstore.dart';
import 'screens/youtube.dart';
import 'screens/whatup.dart';
import 'screens/chrome.dart';
import 'screens/animate.dart';
import 'screens/playuiux.dart';
import 'screens/camera.dart';
import 'screens/imagepicker.dart';
import 'screens/webview.dart';
import 'screens/youtubeplayer.dart';
import 'screens/scopedmodel.dart';
import 'screens/flash.dart';

void main() {
  debugDefaultTargetPlatformOverride =
      TargetPlatform.fuchsia; // for desktop embedder
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/map': (context) => GoogleMapScreen(),
        '/playstore': (context) => PlayStoreScreen(),
        '/youtube': (context) => YoutubeScreen(),
        '/whatup': (context) => WhatupScreen(),
        '/chrome': (context) => ChromeScreen(),
        '/animate': (context) => AnimateScreen(),
        '/playuiux': (context) => PlayUIUXScreen(),
        '/camera': (context) => CameraScreen(),
        '/imagepicker': (context) => ImagePickerScreen(),
        '/webview': (context) => WebViewScreen(),
        '/yplayer': (context) => YoutubePlayerScreen(),
        '/flash': (context) => FlashScreen(),
        '/scoped': (context) => ScopedModelScreen(),
      },
    );
  }
}
