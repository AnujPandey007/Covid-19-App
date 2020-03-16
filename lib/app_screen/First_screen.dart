import 'package:flutter/material.dart';

 
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
          children: <Widget>[
            Container(
              child: Column(
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
                    onDetailsPressed: () {},
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
            ListTile(
              leading: Icon(Icons.account_circle,),
              title: Text(
                "Profile"
              ),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.search,),
              title: Text(
                "Search"
              ),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.notifications,),
              title: Text(
                "Notification"
              ),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.watch_later,),
              title: Text(
                "Recent"
              ),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.settings,),
              title: Text(
                "Settings"
              ),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.lock,),
              title: Text(
                "Log Out"
              ),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.bug_report,),
              title: Text(
                "Bug Report"
              ),
              trailing: Icon(Icons.add_a_photo),
              onTap: (){},
            ),
            ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    "Contact Us"
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text(
                    "Rate Us"
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.adb),
                  title: Text(
                    "About App"
                  ),
                  onTap: (){},
                ),
          ],
        )
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(143, 148, 251, 1),Color.fromRGBO(143, 120, 251, 0.5)
              ]
            )
          ),
        ),
        title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400
            ),
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
          ],
        ),
      ),    
    );
  }
}




