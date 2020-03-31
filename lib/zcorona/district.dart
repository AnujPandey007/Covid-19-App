import 'dart:convert';
import 'package:hello_world/app_screen/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class District extends StatefulWidget {
  
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {

  List data;

  void getinfo() async{
    Response response = await get("https://api.covid19india.org/data.json");
    this.setState(() { 
      var corona = jsonDecode(response.body);
      data = corona["statewise"];
    });
  
  }

  @override
  void initState() {
    super.initState();
    this.getinfo();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : 1,
      itemBuilder: (BuildContext context, int index) {
        if(data == null){
          return null;
        }else{
          return districtPage(index);
        }
      },
    );
  }

Widget districtPage(index) {
    return Container(
     decoration: BoxDecoration(
       color: Colors.white
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Stack(
           overflow: Overflow.visible,
           children: <Widget>[
             FadeAnimation(
               0.0,
               Container(
                 child: SizedBox(
                     height: 340.0,
                     width: 340.0,
                     child: Image.asset(
                       "assets/Images/0.jpg",
                       fit: BoxFit.cover,
                     ),
                   ),
              ),
             ),
             Positioned(
               top: 270.0,
               right: 20.0,
               child: FadeAnimation(0.1,
                 Container(
                   child: Column(
                     children: <Widget>[
                       Text(
                         "Last Updated",
                         style: TextStyle(
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Text(data[index]["lastupdatedtime"].toString()),
                     ],
                   ),
                 ),
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             FadeAnimation(0.2,
               Container(
                 height: 180.0,
                 width: 180.0,
                 child: Card(
                   color: Colors.red[100],
                   elevation: 8.0,
                   margin: EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text(
                         "Confirmed Cases",
                         style: TextStyle(
                           fontSize: 12.0,
                           color: Colors.redAccent,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Text(
                         data[index]["confirmed"].toString(),
                         style: TextStyle(
                           fontSize: 15.0,
                           color: Colors.redAccent,
                           fontWeight: FontWeight.bold
                         ),
                       )
                     ],
                   )
                 )
               ),
             ),
             FadeAnimation(0.4,
               Container(
                 height: 180.0,
                 width: 180.0,
                 child: Card(
                   color: Colors.blue[100],
                   elevation: 8.0,
                   margin: EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text(
                         "Active Cases",
                         style: TextStyle(
                           color: Colors.blueAccent,
                           fontSize: 12.0,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Text(
                         data[index]["active"].toString(),
                         style: TextStyle(
                           color: Colors.blueAccent,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold
                         ),
                       )
                     ],
                   )
                 )
               ),
             ),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             FadeAnimation(0.6,
               Container(
                 height: 180.0,
                 width: 180.0,
                 child: Card(
                   color: Colors.green[100],
                   elevation: 8.0,
                   margin: EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text(
                         "Recovered Cases",
                         style: TextStyle(
                           color: Colors.green,
                           fontSize: 12.0,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Text(
                         data[index]["recovered"].toString(),
                         style: TextStyle(
                           color: Colors.green,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold
                         ),
                       )
                     ],
                   )
                 )
               ),
             ),
             FadeAnimation(0.8,
               Container(
                 height: 180.0,
                 width: 180.0,
                 child: Card(
                   color: Colors.grey[100],
                   elevation: 8.0,
                   margin: EdgeInsets.all(15.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       Text(
                         "Deaths Cases",
                         style: TextStyle(
                           color: Colors.grey,
                           fontSize: 12.0,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                       Text(
                         data[index]["deaths"].toString(),
                         style: TextStyle(
                           color: Colors.grey,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold
                         ),
                       )
                     ],
                   )
                 )
               ),
             ),
           ],
         ),
       ],
     ),
    );
  }



}