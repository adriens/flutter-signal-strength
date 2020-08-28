import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_signal_strength/flutter_signal_strength.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _gsmSignalStrength;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    int gsmSignalStrength;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      gsmSignalStrength = await FlutterSignalStrength.gsmSignalStrength;
    } on PlatformException {
      gsmSignalStrength = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _gsmSignalStrength = gsmSignalStrength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter signal strength Plugin'),
        ),
        body: Center(
          child: Text('Running on: ' + _gsmSignalStrength.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { setState(() { initPlatformState(); });},
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
