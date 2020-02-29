import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Anuj"
              ),
              accountEmail: Text(
                "panuj330@gmail.com"
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "A",
                ),
                backgroundColor: Colors.white,
              ),
              onDetailsPressed: () {
                print("Anuj");
              },
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                child: Text(
                  "B",
                ),
                backgroundColor: Colors.white,
              ),
              ],
            ),
          ],
        )
      ),
      appBar: AppBar(
        title: Text(
          "Account details"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Account Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w100
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                elevation: 10.0,
                highlightColor: Colors.orange,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Home Page",
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
            )
          ],
        ),
      ),    
    );
  }
}
