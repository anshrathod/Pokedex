import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/home.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: HomePage(),
      initialRoute: '/',
      routes: {},
    );
  }
}
