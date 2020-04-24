import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pianoscope/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(Application());
  });
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pianoscope',
      home: HomePage(),
    );
  }
}
