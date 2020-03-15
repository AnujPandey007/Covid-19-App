import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/chat/models/user.dart';
 
class AuthService {

  final FirebaseAuth _auth  = FirebaseAuth.instance;

  //create user object based on FirebaseUser

  User _userFromFirebaseUser (FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in annon

  Future signInAnon() async {

    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign in with email and register

  //register with email and password

  //sign out

  Future signout() async{

    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }



}