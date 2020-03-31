import 'package:flutter/material.dart';
import 'package:hello_world/zcorona/district.dart';
import 'package:hello_world/zcorona/districtinfo.dart';


class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        children: <Widget>[       
          District(),
          Districtinfo()
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
          backgroundColor: Colors.grey[200],
          items: <BottomNavigationBarItem>[        //Must Fill both the icon and title down here
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ), 
              title: Text(
                "STATES",
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
                "DISTRICT",
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
    );
  }

  int selecteditem=0;
  var pagecontroller = PageController();

}





