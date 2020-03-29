import 'package:flutter/material.dart';
import 'package:hello_world/note/note_list.dart';
import 'package:hello_world/zcorona/home.dart';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  
  int selecteditem=0;
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: PageView(
        children: <Widget>[       //Do not enter the name of this* class i.e., here its HomePage
          Home(),
          NoteList()
        ],
        onPageChanged: (index) {
          setState(() {
            selecteditem = index;
          });
        },
        controller: pagecontroller,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[        //Must Fill both the icon and title down here
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),       
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        currentIndex: selecteditem,
        onTap: (index) {
          setState(() {
            selecteditem = index;
            pagecontroller.animateToPage(
              selecteditem, 
              duration: Duration(milliseconds: 200), 
              curve: Curves.linear
            );
          });
        },
      ),
    );
  }
}
