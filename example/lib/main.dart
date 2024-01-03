import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cputil/flutter_cputil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String templateBytes = 'Unknown';
  final _flutterCputilPlugin = FlutterCputil();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Uint8List? _bytes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      _bytes = await _flutterCputilPlugin.convert("");
    } catch (e, s) {
      _bytes = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      templateBytes = _bytes != null ? _bytes.toString() : "TemplateBytes is null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CPUtil example plugin app'),
        ),
        body: Center(
          child: Text('Response: $templateBytes\n'),
        ),
      ),
    );
  }
}
