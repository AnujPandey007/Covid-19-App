import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exp",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: City(),
    );
  }
}

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {

  var _currencies = ["Rupees","Dollars","Pounds","Others"];
  var _currentitemSelected = "Rupees";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }
              ).toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  _currentitemSelected = newValueSelected;
                });
              },
              value: _currentitemSelected,
            ),
          ],
        ),
      ),
    );
  }
}
