import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/services/usermanagement.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String _email;
  String _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
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
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text("Sign Up"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email, password: _password
                  ).then((AuthResult signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}