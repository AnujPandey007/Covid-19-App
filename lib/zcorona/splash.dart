import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hello_world/zcorona/home.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myapp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "/home":(context)=>Home(),
      },
      title: "OnBorading",
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int counter = 0;

  // Async func to handle Futures easier; or use Future.then
  got() async { 
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    setState(() {
      counter = prefs.getInt('isfirst') ?? 0;
    });
  }
  

  @override
  void initState() {
    super.initState();
    got();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          if(counter == 0)
            return IntroductionPage();
          else
            return Home();
        } 
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Text(
            "Quiz\nTest Yourself",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  int counter = 0;

  void nextpage(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // set value
     prefs.setInt('isfirst', 1);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        //image: Image.asset("assets/images/online_Ad.png"),
        title: "Online Ads",
        body: "This is an online ad.",
        footer: Text(
          "MTECHVIRAL",
          style: TextStyle(color: Colors.black),
        ),
      ),
      PageViewModel(
        //image: Image.asset("assets/images/online_article.png"),
        title: "Online Article",
        body: "This is an online article.",
        footer: Text(
          "MTECHVIRAL",
          style: TextStyle(color: Colors.black),
        ),
      ),
      PageViewModel(
        //image: Image.asset("assets/images/website.png"),
        title: "Html & CSS",
        body: "This is an online course where you can learn html & css",
        footer: Text(
          "MTECHVIRAL",
          style: TextStyle(color: Colors.black),
        ),
      ),
      PageViewModel(
        //image: Image.asset("assets/images/shared_workspace.png"),
        title: "Workspace",
        body: "Want a workspace? Then check it out.",
        footer: Text(
          "MTECHVIRAL",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: getPages(),
          done: Text(
            "Done",
            style: TextStyle(color: Colors.black),
          ),
          onDone: () {
            return nextpage(context);
          },
          showSkipButton: true,
          skip: const Text("Skip"),
          onSkip: () {
            return nextpage(context);
          },
        ),
      ),
    );
  }
}