import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/auth/homepage.dart';
import 'package:hello_world/auth/signinpage.dart';

class Myapp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Auth",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/LandingPage" : (BuildContext context) => Myapp2(),
        "/Login" : (BuildContext context)=> LoginPage(),
        "/SignIn" : (BuildContext context)=> SignIn(),
        "/Home" : (BuildContext context)=> HomePage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Email"
                ),
                onChanged: (value) {
                  setState(() {
                    _email=value;
                  });
                },
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password=value;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text("Login"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email, password: _password
                  ).then((user) {
                    Navigator.of(context).pushReplacementNamed("/Home");
                  })
                  .catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 15.0,),
              Text("Dont have an account?"),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text("Sign Up"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.pushNamed(context, "/SignIn");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}