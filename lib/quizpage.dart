import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hello_world/homeq.dart';
import 'package:hello_world/result.dart';
import 'package:hello_world/splash.dart';

class LoadJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
        builder: (context, snapshot) {
          List data = json.decode(snapshot.data.toString());
          if(data == null){
            return SplashScreen();
          }else{
            return QuizPage(data : data);
          }
        }
      ),
    );
  }
}

class QuizPage extends StatefulWidget {

  final data;
  
  QuizPage({Key key, @required this.data}) : super(key : key);

  @override
  _QuizPageState createState() => _QuizPageState(data : data);
}

class _QuizPageState extends State<QuizPage> {

  List data;
  _QuizPageState({this.data});
  
  int i = 1;
  int marks = 0;
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  bool canceltimer = false;
  var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btncolor = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue,
  };

  // overriding the initstate function to start timer as this screen is created(Without it if you tap on first time (First question) to start quiz the timer will not start)
  @override
  void initState() {
    starttimer();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }


  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {  // Didn't gave answer
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) { //After giving ans
          t.cancel();
        } else {
          timer -= 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Resultpage(marks: marks)));
      }
      btncolor["a"] = Colors.blue;
      btncolor["b"] = Colors.blue;
      btncolor["c"] = Colors.blue;
      btncolor["d"] = Colors.blue;
    });
    starttimer();
  }


  void checkans(String k){
    if(data[2][i.toString()]==data[1][i.toString()][k])
    {
      print("Correct");
      marks +=5;
      colortoshow = right;
    }
    else{
      print("Wrong");
      colortoshow = wrong;
    }

    setState(() {
      canceltimer = true;
      btncolor[k] = colortoshow;
      Timer(Duration(seconds: 1), nextquestion);
    });

  }



  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {
          return checkans(k);
        },
        child: Text(
          data[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        elevation: 0.0,
        highlightElevation: 0.0,
        highlightColor: Colors.blue[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  Future <bool> _backpressed () {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you really want to exit?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> Homeq()));
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
        return _backpressed();
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  data[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}