import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {

  final String uid;
  DataBaseService({this.uid});

  //collection reference

  final CollectionReference chatCollection = Firestore.instance.collection("chat");

  Future updateUserData (String sugars, String name, int strength ) async {

    return await chatCollection.document(uid).setData({
      "sugars": sugars,
      "name" :name,
      "strength" : strength
    });

  }


}