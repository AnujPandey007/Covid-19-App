import 'package:flutter/material.dart';
import 'package:hello_world/practice.dart';
import './chat/screens/Wrapper.dart';
import './chat/screens/home/Home.dart';
import './app_screen/Login.dart';
import './Calculator/Calculator.dart';

void main() => runApp(App());


class Myapp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper()
    );
  }
}

