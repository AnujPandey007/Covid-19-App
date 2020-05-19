import 'package:flutter/material.dart';
import 'package:hello_world/service/auth.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth3 = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('LogOut'),
            onPressed: () async{
              await _auth3.signingOut();
            },
          ),
        ],
      ),
      body: Container(
        
      ),
    );
  }
}