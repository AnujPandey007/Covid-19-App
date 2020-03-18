import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world/chat/models/chat.dart';
import 'package:hello_world/chat/models/user.dart';

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


  //chat list from SnapShot

  List<Chat>_chatListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.documents.map((doc){
      return Chat(
        name: doc.data["name"] ?? "",
        strength : doc.data["strength"] ?? 0,
        sugars : doc.data["sugars"] ?? "0",
      );
    }).toList();
  }

  //UserData from SnapShot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      sugars: snapshot.data["sugars"],
      strength: snapshot.data["strength"],
    );
  }


  // get chat stream

  Stream<List<Chat>> get chat{
    return chatCollection.snapshots()
    .map(_chatListFromSnapshot);
  }

  //get user doc stream

  Stream<UserData> get userData {
    return chatCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}