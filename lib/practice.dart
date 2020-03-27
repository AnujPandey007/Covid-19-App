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
  Map bata;

  void getinfo() async{
    Response response = await get("https://coronavirus-tracker-api.herokuapp.com/v2/locations");
    //List data = jsonDecode(response.body);
    this.setState(() { 
      var corona = jsonDecode(response.body);
      data = corona["locations"];
      bata = corona;
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
      body: ListView.separated(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(data[index]["id"].toString()),
              Text(data[index]["country"].toString()),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(bata["latest"]["confirmed"].toString()),
          );
        },
      ),
    );
  }
}
