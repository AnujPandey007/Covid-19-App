import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  
  String val;
  Second({this.val});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen2"),
      ),
      body: Center(
        child: Text(val),
      ),
    );
  }
}