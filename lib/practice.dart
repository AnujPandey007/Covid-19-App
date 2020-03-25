import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Tim(),
    );
  }
}

class Tim extends StatefulWidget {
  @override
  _TimState createState() => _TimState();
}

class _TimState extends State<Tim> with TickerProviderStateMixin{

  TabController tb;
  int hour = 0;
  int min = 0;
  int sec = 0;
  String time = "";
  bool started = true;
  bool stopped = true;
  bool canceltimer = false;
  int timefortimer;
  final dur = const Duration(seconds: 1);

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void start() {
    setState(() {
      started = false;
      stopped = false;
    });
    timefortimer = (hour*3600 + min*60 + sec);
    //print(timefortimer.toString());
    Timer.periodic(dur, (Timer t) {
      setState(() {
        if(timefortimer < 1 || canceltimer == true){
          t.cancel();
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Tim())
          );
        }else{
          timefortimer = timefortimer - 1;
          time = timefortimer.toString();
        }
      });
    });
  }

  void stop(){

    setState(() {
      started = true;
      stopped = true;
      canceltimer = true;
      time = "";
    });



  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text("HH"),
                    ),
                    NumberPicker.integer(
                      initialValue: hour, 
                      minValue: 0, 
                      maxValue: 23, 
                      onChanged: (val){
                        setState(() {
                          hour = val;
                        });
                      }
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text("MM"),
                    ),
                    NumberPicker.integer(
                      initialValue: min, 
                      minValue: 0, 
                      maxValue: 59, 
                      onChanged: (val){
                        setState(() {
                          min = val;
                        });
                      }
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text("SS"),
                    ),
                    NumberPicker.integer(
                      initialValue: sec, 
                      minValue: 0, 
                      maxValue: 59, 
                      onChanged: (val){
                        setState(() {
                          sec = val;
                        });
                      }
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              time,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
           Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: started ? start : null,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.green,
                  onPressed: stopped ? null : stop,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch"),
        centerTitle: true,
        bottom: TabBar(
          controller: tb,
          labelStyle: TextStyle(
            fontSize: 20.0
          ),
          labelPadding: EdgeInsets.only(bottom: 10.0),
          unselectedLabelColor: Colors.white70,
          tabs: <Widget>[
            Text("Timer"),
            Text("StopWatch")
          ],
        ),
      ),
      body: TabBarView(
        controller: tb,
        children: <Widget>[
          timer(),
          Text("StopWatch")
        ],
      ),
    );
  }
}
