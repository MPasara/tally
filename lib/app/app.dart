import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const new({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: Text('Material home after DI'))),
    );
  }
}
