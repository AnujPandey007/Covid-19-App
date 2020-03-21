import 'package:flutter/material.dart';
import 'package:hello_world/quote.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice",
      debugShowCheckedModeBanner: false,
      home: Anuj(),
    );
  }
}

    

class Anuj extends StatefulWidget {
  @override
  _AnujState createState() => _AnujState();
}

class _AnujState extends State<Anuj> {

  List<Quote> quotes = [

    Quote(authors: "Krishn", text: "A man is made by his belief. As he believes, so he becomes"),
    Quote(authors: "Hari", text:"Set your heart upon your work but never its reward"),
    Quote(authors: "Dwarikadhish", text: "Happiness is the state of mind, that has nothing to do with the external world"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice"),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(143, 148, 251, 1.0), Color.fromRGBO(143, 148, 251, 0.0)
              ]
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 1.0), Color.fromRGBO(143, 148, 251, 0.0)
            ]
          ),
        ),
        child: Column(
          children: quotes.map((quote) => QuoteCard(
            quote:quote,
            delete:(){
              setState(() {
                quotes.remove(quote);
              });
            }
          )).toList(),
        ),
      ),
    );
  }
}

