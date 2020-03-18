import 'package:flutter/material.dart';
import 'package:hello_world/chat/models/chat.dart';
import 'package:hello_world/chat/screens/home/chattile.dart';
import 'package:provider/provider.dart';


class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {

    final chat = Provider.of<List<Chat>>(context)??[];

    return ListView.builder(
      itemCount: chat.length,
      itemBuilder: (context,index) {
        return ChatTile(chats:chat[index]);
      },
    );
  }
}