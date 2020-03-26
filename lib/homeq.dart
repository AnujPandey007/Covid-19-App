import 'package:flutter/material.dart';
import 'package:hello_world/quizpage.dart';


class Homeq extends StatefulWidget {
  @override
  _HomeqState createState() => _HomeqState();
}

class _HomeqState extends State<Homeq> {

  List<String> langname = [
    "India",
    "USA",
    "Germany",
    "Greece",
    "Indonesia"
  ];

  List<String> images = [
  "assets/Images/in.png",
  "assets/Images/usa.png",
  "assets/Images/germany.png",
  "assets/Images/greece.png",
  "assets/Images/indonesia.png"
  ];

  List<String> des = [
    "asdasdkuifouiahd",
    "asdasdkuifouiahd",
    "asdasdkuifouiahd",
    "asdasdkuifouiahd",
    "asdasdkuifouiahd",
  ];

  Widget customcard(String name, String images, String des) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => LoadJson()
          ));
        },
        child: Material(
          color: Colors.blue[400],
          elevation: 15.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(15.0),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(images),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
               Center(
                 child: Text(
                   name,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20.0
                   ),
                 ),
               ),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 15.0),
                 child: Text(
                   des,
                   style: TextStyle(
                     fontSize: 18.0,
                     color: Colors.white70
                   ),
                   maxLines: 5,
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          customcard(langname[0],images[0],des[0]),
          customcard(langname[1],images[1],des[1]),
          customcard(langname[2],images[2],des[2]),
          customcard(langname[3],images[3],des[3]),
          customcard(langname[4],images[4],des[4]),
        ],
      ),
    );
  }
}