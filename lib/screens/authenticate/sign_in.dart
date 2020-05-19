import 'package:flutter/material.dart';
import 'package:hello_world/service/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth2 = AuthService(); //To use AuthService Class of auth.dart so we are assigning it to a variable for easy approach

  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          //key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign In Annon',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  dynamic result2 = await _auth2.signInAnnon(); //assigning to a variable result2
                  //Why? dynamic, because it can return either null or a user from auth.dart file
                  if(result2==null){
                    print("error in Sign in");
                  }
                  else{
                    print("Signed in");
                    print(result2.uid);
                  }
                }
                
              ),
              SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}