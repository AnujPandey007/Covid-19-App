import 'package:flutter/material.dart';
import 'package:hello_world/chat/services/auth.dart';
import 'package:hello_world/practice.dart';
import 'package:provider/provider.dart';
import './chat/screens/Wrapper.dart';
import './chat/screens/home/Home.dart';
import './app_screen/Login.dart';
import './Calculator/Calculator.dart';
import 'package:provider/provider.dart';
import './chat/models/user.dart';

void main() => runApp(Myapp3());

class Myapp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()
      ),
    );
  }
}

