import 'package:flutter/material.dart';
import 'package:hello_world/zcorona/india.dart';
import 'package:hello_world/zcorona/states.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<bool> data() {
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Do you really want to exit?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.pop(context,true);
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context,false);  //if its true then it will exit
            },
          ),
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return data();
      },
      child: Scaffold(
        extendBody: true,
        body: PageView(
          children: <Widget>[       
            India(),
            Statesofindia()
          ],
          onPageChanged: (index) {
            setState(() {
              selecteditem = index;
            });
          },
          controller: pagecontroller,
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          notchMargin: 4.5,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
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
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "New Note", 
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  int selecteditem=0;
  var pagecontroller = PageController();

}





