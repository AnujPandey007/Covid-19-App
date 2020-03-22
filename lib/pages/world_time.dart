import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; //location name for the UI

  String time; //time in that particular location\

  String flag; //url to an asset flag icon

  String url; //location url for api endpoint

  bool isDayTime; // whether its day or night

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try {
      // make the request 
    Response response = await get("http://worldtimeapi.org/api/timezone/$url"); // At the url point (end) as location will change so it will
    //Decoding String into values
    Map data = jsonDecode(response.body);
    //print(data);
    
    //get properties (2 properties) from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);
    //print(datetime);
    //print(offset);

    //create a datetime object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //set the time property
    //time = now.toString();
    //setting day or night
    isDayTime = (now.hour >6 && now.hour <17) ? true : false;     //  6am to 5 pm
    //New format of date and time by intl package
    time = DateFormat.jm().format(now);

    }catch(e){
      print("Erroe is $e");
      time = "Could not find time Data";

    }

  }
  

}


