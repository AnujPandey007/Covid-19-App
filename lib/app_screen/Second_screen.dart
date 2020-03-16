import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget { 
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 410.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/1.png"),
                    fit: BoxFit.cover
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      top: 30.0,
                      height: 190.0,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/Images/3.png"),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 170.0,
                      height: 150.0,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/Images/4.png"),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40.0,
                      top: 30.0,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset("assets/Images/4.png"),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210.0,
                      left: 130.0,
                      child: Container(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ) ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                    child: Container(
                    decoration: BoxDecoration(
                      border: Border(),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 0.5),
                          blurRadius: 20.0,
                          offset: Offset(0, 10)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "User Name",
                              hintStyle: TextStyle(
                                fontSize: 13.0,                                        
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500],                    
                              ),
                              border: InputBorder.none
                            ),
                           ), 
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontSize: 13.0,                                        
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500],                    
                              ),
                              border: InputBorder.none
                            ),
                           ), 
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 13.0,                                        
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500],                    
                              ),
                              border: InputBorder.none
                            ),
                           ), 
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                fontSize: 13.0,                                        
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[500],                    
                              ),
                              border: InputBorder.none
                            ),
                           ), 
                        ),
                      ],
                    )
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 25.0),
                    child: Container(
                      height: 50.0,
                      width: 320.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color.fromRGBO(143, 148, 251, 1),Color.fromRGBO(143, 148, 251, 0.5)]
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 0.5),
                            blurRadius: 20.0,
                            offset: Offset(0, 7)
                          ),
                        ]
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: MaterialButton(
                                    onPressed: () {},
                                    child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    highlightElevation: 0.0,
                                    splashColor: Colors.transparent,
                                    highlightColor: Color.fromRGBO(143, 148, 251, 1),
                                    height: 50.0,
                                    minWidth: 320.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
