import 'package:flutter/material.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/screens/authenticate/authenticate.dart';
import 'package:hello_world/screens/home/home.dart';
import 'package:hello_world/service/auth.dart';
import 'package:provider/provider.dart';


class Myapp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().newuser,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user0 = Provider.of<User>(context);

    //return either home or authenticate
    
    if(user0==null){
      return Authenticate();
    }
    else{
      return HomePage();
    }

  }
}