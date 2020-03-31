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
          notchMargin: 3.5,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[        //Must Fill both the icon and title down here
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ), 
                title: Text(
                  "INDIA",
                  style: TextStyle(
                    color: Colors.black
                  ),
                )
              ),       
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ), 
                title: Text(
                  "STATES",
                  style: TextStyle(
                    color: Colors.black
                  ),
                )
              ),
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
          backgroundColor: Colors.grey[350],
          tooltip: "Important Notes", 
          child: Icon(
            Icons.add,
            color: Colors.black
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  int selecteditem=0;
  var pagecontroller = PageController();

}





