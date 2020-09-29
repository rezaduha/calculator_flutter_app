import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator_flutter_app/screen/calculator_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: CalculatorScreen(),
    );
  }
}
