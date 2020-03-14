import 'package:flutter/material.dart';

class Myapp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Calculator(),
    );
  }
}


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int x;
  int y;
  String texttodisplay=""; //null value
  String result;
  String operatortoperform;

  void buttonclicked(String val)
  {
    if (val=="C")
    {
      texttodisplay="";
      x=0;
      y=0;
      result="";
      operatortoperform="";

    }
    else if(val=="+"||val=="-"||val=="x"||val=="/")
    {
      x=int.parse(texttodisplay);
      result="";
      operatortoperform= val;

    }
    else if(val=="=")
    {
      y=int.parse(texttodisplay);
      if(operatortoperform=="+")
      {
        result=(x+y).toString();
      }
      if(operatortoperform=="-")
      {
        result=(x-y).toString();
      }
      if(operatortoperform=="x")
      {
        result=(x*y).toString();
      }
      if(operatortoperform=="/")
      {
        result=(x/y).toString();
      }

    }
    else
    {
      result= int.parse(texttodisplay+val).toString();
    }

    setState(() {
      texttodisplay=result;
    });


  }

  Widget custombutton(String val){
    return Expanded(
      child: MaterialButton(
            padding: EdgeInsets.all(30.0),
            highlightColor: Color.fromRGBO(143, 148, 251, 0.5),
            onPressed: () {
              buttonclicked(val);
            },
            child: Text(
              "$val",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600
              ),
            )
          ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
              ]
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
                    ]
                  )
                ),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
                    ]
                  )
              ),
              child: Row(
                children: <Widget>[
                  custombutton("7"),
                  custombutton("8"),
                  custombutton("9"),
                  custombutton("+"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
                    ]
                  )
              ),
              child: Row(
                children: <Widget>[
                  custombutton("4"),
                  custombutton("5"),
                  custombutton("6"),
                  custombutton("-"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
                    ]
                  )
              ),
              child: Row(
                children: <Widget>[
                  custombutton("1"),
                  custombutton("2"),
                  custombutton("3"),
                  custombutton("x"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      Color.fromRGBO(143, 148, 251, 0.5),Color.fromRGBO(143, 148, 251, 1)
                    ]
                  )
              ),
              child: Row(
                children: <Widget>[
                  custombutton("C"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("/"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




