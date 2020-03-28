import 'package:flutter/material.dart';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: Hom(),
    );
  }
}

class Hom extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Hom> {


  Future<bool> data () {
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Do you really want to exit?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.pop(context,true);
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context,false);  //if its true then it will exit
            },
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return data();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body:Container(
          alignment: Alignment.center,
          child: Text(
            "Hello",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      )
    );
  }
}
