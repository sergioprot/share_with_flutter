import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_with_flutter/share_with_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _plainText = 'No plain text was received';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String text;
    try {
      text = await ShareWithFlutter.getPlainText() ?? 'No plain text';
    } on PlatformException {
      text = 'Exception was thrown while trying to get plain text';
    }
    if (!mounted) return;

    setState(() {
      _plainText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share With Flutter'),
        ),
        body: Center(
          child: Text(_plainText),
        ),
      ),
    );
  }
}
