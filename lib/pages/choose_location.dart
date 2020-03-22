import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Location"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            setState(() {
              counter +=1;
            });
          },
          child: Text("Counter is $counter"),
        )
      ),
    );
  }
}