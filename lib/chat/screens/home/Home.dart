import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/chat/models/chat.dart';
import 'package:hello_world/chat/screens/home/settings_form.dart';
import 'package:hello_world/chat/services/auth.dart';
import 'package:hello_world/chat/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/chat/screens/home/chatlist.dart';

 

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
      void _showSettingsPanel() {
        showModalBottomSheet(context: context, builder:(context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        });
      }

    return StreamProvider<List<Chat>>.value(
      value: DataBaseService().chat,
      child: Scaffold(
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
            ),
            FlatButton.icon(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: Icon(Icons.settings), 
              label: Text("settings")
            ),
          ],
        ),
        body: ChatList(),
      ),
    );
  } 
}