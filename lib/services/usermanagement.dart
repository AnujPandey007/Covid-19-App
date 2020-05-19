import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserManagement {

  storeNewUser(user, context) {
    Firestore.instance.collection("/users").add({
      "email" : user.email,
      "uid" : user.uid
    }).then((val) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed("/Home");
    })
    .catchError((e) {
      print("e");
    });
  }
}