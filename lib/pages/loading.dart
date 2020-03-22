import 'package:flutter/material.dart';
import 'package:hello_world/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

    void setupWorldTime() async{
    WorldTime instance = WorldTime(location:"Berlin", flag:"germany.png", url:"Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location":instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "isDayTime":instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}