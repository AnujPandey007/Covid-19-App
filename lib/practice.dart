import 'package:flutter/material.dart';
import 'package:hello_world/statefull.dart';
import 'package:hello_world/stateless.dart';


class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Homeq(),
    );
  }
}


class Homeq extends StatefulWidget {
  @override
  _HomeqState createState() => _HomeqState();
}

class _HomeqState extends State<Homeq> {

  String val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                val = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> First(val : val)));
              },
              child: Text("Switch To First"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Second(val : val)));
              },
              child: Text("Switch To Second"),
            ),
          ],
        ),
      ),
    );
  }
}