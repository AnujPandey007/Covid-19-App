import 'package:flutter/material.dart';
import 'First_screen.dart';
import 'Second_screen.dart';

class Myapp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/first':(context)=> FirstScreen(),
        '/second':(context)=>SecondScreen(),
        '/home':(context)=>HomePage(),
      },
      title: "Navigation",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Navigation"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Home Page",
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
                  Navigator.pushNamed(context, "/first");
                },
                elevation: 10.0,
                highlightColor: Colors.orange,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Main Screen",
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second");
                },
                elevation: 10.0,
                highlightColor: Colors.orange,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  "Account Details",
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