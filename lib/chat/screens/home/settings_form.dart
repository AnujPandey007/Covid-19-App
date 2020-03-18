import 'package:flutter/material.dart';
import 'package:hello_world/chat/models/user.dart';
import 'package:hello_world/chat/shared/constants.dart';
import 'package:hello_world/chat/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/chat/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String>sugars = ["0","1","2","3","4"];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DataBaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData)
        {
          UserData userData = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text(
                  "Update Your Info",
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textinputDecoration.copyWith(hintText: "Name"),
                  validator: (val)=> val.isEmpty ? "Please enter a name" : null,
                  onChanged: (val) {
                    setState(() =>  _currentName = val);
                  },
                ),
                SizedBox(height: 20.0,),

                DropdownButtonFormField(
                  decoration: textinputDecoration,
                  value: _currentSugars ?? userData.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text("$sugar sugars"),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() =>  _currentSugars = val);
                  },
                ),
                Slider(
                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  value: (_currentStrength ?? userData.strength).toDouble(), 
                  onChanged: (val){
                    setState(() {
                      _currentStrength = val.round();
                    });
                  },
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text("Update"),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      await DataBaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData.sugars,
                        _currentName ?? userData.name,
                        _currentStrength ?? userData.strength
                      );
                      Navigator.pop(context);
                    }
                  },
                ),

              ],
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}

