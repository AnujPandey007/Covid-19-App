import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green
            ),
          ),
          DraggableScrollableSheet( //Screen size is assumed as 1.0
            maxChildSize: 0.6,    //How much it will go up
            minChildSize: 0.10,   //how much it will go down
            builder: (context, scrollcontroller) {
              return Stack(
                overflow: Overflow.visible,  // To make the button overflow
                children: <Widget>[
                  Container(
                     decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      controller: scrollcontroller,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Task No $index", 
                            style: TextStyle(color: Colors.grey[900], 
                            fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "This is the detail of task No $index", 
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          trailing: Icon(Icons.check_circle, color: Colors.greenAccent),
                          isThreeLine: true,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add, color: Colors.white,),
                      backgroundColor: Colors.pinkAccent,
                    ),
                    top: -30,
                    right: 30,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
