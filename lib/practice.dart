import 'package:flutter/material.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "World Map",
      debugShowCheckedModeBanner: false,
      home: HomeP(),
    );
  }
}

class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {


  Widget portrait(){
    return Center(
      child: Text("Portrait"),
    );
  }

  Widget landscape(){
    return Center(
      child: Text("Landscape"),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice"),
      ),
      body: OrientationBuilder(
        builder: (context,orientation) {
          if(orientation==Orientation.portrait){
            return portrait();
          }else{
            return landscape();
          }
        },
      ),
    );
  }

  

}