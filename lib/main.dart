import 'package:flutter/material.dart';
import 'package:pianoscope/screens/home_page.dart';
import 'package:pianoscope/screens/settings.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pianoscope',
      home: HomePage(),
      routes: {
        '/settings': (BuildContext context) => Settings(),
      },
    );
  }
}
