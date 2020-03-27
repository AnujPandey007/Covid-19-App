import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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

  List data;

  void getinfo() async{
    Response response = await get("https://jsonplaceholder.typicode.com/posts");
    //List data = jsonDecode(response.body);
    this.setState(() { 
      data = jsonDecode(response.body);
    });

  }

  @override
  void initState() {
    super.initState();
    this.getinfo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listviews"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}


