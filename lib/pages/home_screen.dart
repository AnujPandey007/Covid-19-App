import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map data = {}; // Is same as Map<dynamic, dynamic> data = {}; thus, dynamic is hidden


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //set background image and color
    String images = data['isDayTime'] ? 'assets/Images/day.png' : 'assets/Images/night.png';
    Color colors = data['isDayTime'] ? Colors.lightBlue:Colors.indigo[800];

    return Scaffold(
      backgroundColor: colors,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$images'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {                        //Updating all the data at once using map
                          "location":result["location"],
                          "flag":result["flag"],
                          "time":result["time"],
                          "isDayTime":result["isDayTime"]
                        };
                      });
                  }, 
                  icon: Icon(
                    Icons.location_on, 
                    color: Colors.white,
                  ), 
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["time"],
                      style: TextStyle(
                        fontSize: 80.0,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}