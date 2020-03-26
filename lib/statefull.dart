import 'package:flutter/material.dart';

class First extends StatefulWidget {
  
  String val;
  First({Key key, @required this.val}):super(key:key);

  @override
  _FirstState createState() => _FirstState(val:val);
}

class _FirstState extends State<First> {

  String val;
  _FirstState({this.val});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen1"),
      ),
      body: Center(
        child: Text(val),
      ),
    );
  }
}