import 'package:flutter/material.dart';
import 'package:hello_world/splash.dart';


class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: SplashScreen()
    );
  }
}