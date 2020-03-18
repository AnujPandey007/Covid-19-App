import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exp",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: City(),
    );
  }
}


class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {

  String name = "Anuj";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changetext();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("City"),
      ),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 100.0,
              width: 100.0,
            ),
             RaisedButton(
              onPressed: () {
                changecolor();
              },
              child: Text("Change Color"), 
            ),
          ],
        )
      ),
    );
  }

  void changecolor() {

    setState(() {
      

    });
  }

  void changetext() {
    setState(() {
      if(name.startsWith("A"))
      name = "Pandey";
      else
      name = "Anuj";
    });
  }

}


