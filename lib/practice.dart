import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hello_world/zcorona/home.dart';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Hom(),
    );
  }
}

class Hom extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () { //Time Duration i.e., for how much time you want to show the splashscreen
      Navigator.pushReplacement(context, MaterialPageRoute(   //SplashScreen Main Code
        builder: (context) => Home(), // Name of the Page that you want to go
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:Container(
        alignment: Alignment.center,
        child: Text(
          "Hello",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
