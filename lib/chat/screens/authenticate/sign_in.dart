import 'package:flutter/material.dart';
import 'package:hello_world/chat/services/auth.dart';



class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "SignIn"
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null)
            {
              print("Error in Sigining in");
            }
            else {
              print("Successful Signed in");
              print(result);
            }
          },
          child: Text(
            "Sign in Anon"
          ),
        ),
      ),
    );
  }
}