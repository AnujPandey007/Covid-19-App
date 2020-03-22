import 'package:flutter/material.dart';
import 'package:hello_world/pages/choose_location.dart';
import 'package:hello_world/pages/home_screen.dart';
import 'package:hello_world/pages/loading.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World Map",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Load(),
        "/home":(context) => HomeScreen(),
        "/location":(context) => ChooseLocation()
      },
    );
  }
}