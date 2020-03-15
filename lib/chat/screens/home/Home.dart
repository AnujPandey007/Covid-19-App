import 'package:flutter/material.dart';
import 'package:hello_world/chat/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signout();
            }, 
            icon: Icon(Icons.person), 
            label: Text("LogOut")
            )
        ],
      ),

    );
  } 
}