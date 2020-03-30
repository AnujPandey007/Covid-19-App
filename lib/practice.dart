import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  String phoneno = "6291523662";

  _launchURL() async {

  const url = "https://innovate.mygov.in/";

  if (await canLaunch(url)) {

    await launch(url);

  } else {

    throw 'Could not launch $url';

    }

  }

  Future <void> _makephonecall (String url) async{

    if(await canLaunch(url)){

      await launch(url);

    }else{
      
      throw "Could Not launch $url";

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _launchURL();
            },
            child: Text("Click to Go To URL "),
          ),
          RaisedButton(
        onPressed: () {
          _makephonecall("tel: $phoneno");
        },
        child: Text("Click to Go To Phone"),
      ),
        ],
      ),
      
    );
  }


}
