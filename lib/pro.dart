import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JSON",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Cal(),
    );
  }
}

class Cal extends StatefulWidget {
  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  @override
  Widget build(BuildContext context) {
    
    void getinfo() async{
      Response co = await get("https://coronavirus-tracker-api.herokuapp.com/v2/locations");
      Map corona = jsonDecode(co.body);
      print(corona["latest"]["confirmed"]);
      print(corona["locations"][0]["country"]);
    }
    
    getinfo();

    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
        builder: (context,snapshot) {
          var mydata = json.decode(snapshot.data.toString());
          if(mydata==null) {
            return Center(
              child: Text(
                "Loading",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            );
          }else{
            return Center(
              child: Text(
                mydata[0]["name"],
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
