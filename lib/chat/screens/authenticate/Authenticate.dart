import 'package:flutter/material.dart';
import 'package:hello_world/chat/screens/authenticate/register.dart';
import 'package:hello_world/chat/screens/authenticate/sign_in.dart';


class Authenticate extends StatefulWidget {
  @override 
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn==true)
    {
      return Signin(toggleV : toggleView); // toggleV here is parameter(can be any name) and toggleView is its value
    }
    else 
    {
      return Register(toggleV : toggleView);
    }
  }
}



