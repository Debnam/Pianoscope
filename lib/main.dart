import 'package:flutter/material.dart';
import 'package:pianoscope/screens/home_page.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pianoscope',
      home: HomePage(),
    );
  }
}
