import 'package:flutter/material.dart';
import 'package:hello_world/chat/models/chat.dart';


class ChatTile extends StatelessWidget {

  final Chat chats;

  ChatTile({this.chats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.only(left:20.0 ,top:6.0 ,right:20.0 ,bottom:0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[chats.strength],
          ),
          title: Text(chats.name),
          subtitle: Text("Takes ${chats.sugars} sugar(s)"),
        ),
      ),
    );
  }
}
