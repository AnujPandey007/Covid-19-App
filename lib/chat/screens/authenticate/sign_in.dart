import 'package:flutter/material.dart';
import 'package:hello_world/chat/services/auth.dart';
import 'package:hello_world/chat/shared/constants.dart';
import 'package:hello_world/chat/shared/loading.dart';



class Signin extends StatefulWidget {

  final Function toggleV;
  Signin({this.toggleV});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field state

  String email = "";
  String password = "";
  String error ="";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "SignIn"
        ),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {
            widget.toggleV();
          }, 
          icon: Icon(Icons.person), 
          label: Text("Register")
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textinputDecoration.copyWith(hintText: "Email"),
                validator: (val)=> val.isEmpty ? "Enter Valid Email" : null,
                onChanged: (val) {
                  setState(() =>  email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textinputDecoration.copyWith(hintText: "Password"),
                validator: (val)=> val.length <6 ? "Enter Password with more than 6 characters" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() =>  password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink,
                child: Text("SignIn",
                style: TextStyle( 
                  color: Colors.white
                ),
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signinWithEmailAndPassword(email, password);
                    if (result == null)
                    {
                      setState(() {
                        error = "Could Not SignIn";
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}