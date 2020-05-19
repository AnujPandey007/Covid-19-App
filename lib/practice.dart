import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Bar",
          style: TextStyle(
            fontStyle: FontStyle.italic
          ),
        ),
      ),
      body: Container(
        
      ),
    );
  }
}