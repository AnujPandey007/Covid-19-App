import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object based on Firebase User

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get newuser{ //This User is our custom user model used in user.dart
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in Annon

  Future signInAnnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign in with email and password


  //register with email and password


  //sign out

  Future signingOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }


}