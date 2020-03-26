import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_world/homeq.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Homeq(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Text(
            "Quiz\nTest Yourself",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}