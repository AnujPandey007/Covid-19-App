import 'package:flutter/material.dart';
import 'package:hello_world/app_screen/Second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
            ListTile(
              title: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/first");
                },
                child: Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              )
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle,),
              title: Text(
                "Account Details"
              ),
              trailing: Icon(Icons.add_a_photo),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> SecondScreen(),
                )
                );
              },
            ),
            Divider(),
            Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.bug_report,),
                title: Text(
                "Bug Report",
                ),
              ),
            ),
            ),
          ],
        )
      ),
      appBar: AppBar(
        title: Text(
          "Main Screen"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Main Screen",
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
                  Navigator.pushNamed(context, "/home");
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