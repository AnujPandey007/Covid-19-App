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
  
  Icon custombutton = Icon(Icons.search);
  Widget customSearchBar = Text("Search Bar");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: <Widget>[
          IconButton(
            icon: custombutton, 
            onPressed: (){
              setState(() {
                if(this.custombutton.icon == Icons.search){
                  this.custombutton = Icon(Icons.cancel);
                  this.customSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Here",
                      hintStyle: TextStyle(
                        color: Colors.white70
                      )
                    ),
                  );
                }
                else{
                  this.custombutton = Icon(Icons.search);
                  this.customSearchBar = Text("Search Bar");
                }
              });
            },
          ),
        ],

      ),
      body: Center(
        child: Container(
          child: Text("Search"),
        ),
      ),
    );
  }
}