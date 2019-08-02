import 'package:flutter/material.dart';
import 'package:torch/torch.dart';
import 'dart:async';

class FlashScreen extends StatefulWidget {
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0;

  @override
  void initState() {

    super.initState();
    initPlatformState();
  }

  void initPlatformState() async {
    bool hasFlash = await Torch.hasTorch;
    print("Device has flash? $hasFlash");
    setState(() {
      _hasFlash = hasFlash;
    });
  }

  Future<void> _turnFlash() async {
    _isOn ? Torch.turnOff() : Torch.turnOn();
    var f = await Torch.hasTorch;
    setState(() {
      _hasFlash = f;
      _isOn = !_isOn;
    });
  }

  _intensityChanged(double intensity) {
    Torch.turnOn();
    setState(() {
      _intensity = intensity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ThasTorch plugin example')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Device has flash: $_hasFlash\n Flash is on: $_isOn'),
              Slider(
                  value: _intensity,
                  onChanged: _isOn ? _intensityChanged : null),
              RaisedButton(
                  onPressed: () async =>
                      await Torch.flash(Duration(seconds: 2)),
                  child: Text("Flash for 2 seconds"))
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(_isOn ? Icons.flash_off : Icons.flash_on),
          onPressed: _turnFlash),
    );
  }
}
