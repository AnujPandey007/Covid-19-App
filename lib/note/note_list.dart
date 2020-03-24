import 'package:flutter/material.dart';
import 'dart:ui';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getnote(),
      floatingActionButton: FloatingActionButton(
        tooltip: "New Note", 
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  ListView getnote(){
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle2;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.arrow_back),
            ),
            title: Text("Title"),
            subtitle: Text("SubTitle"),
            trailing: Icon(Icons.delete),
            onTap: () {
              print("asd");
            },
          ),
        );
      },
    );
  }


 }


