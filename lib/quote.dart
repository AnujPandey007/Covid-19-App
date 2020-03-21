import 'package:flutter/material.dart';
class Quote {

  String text;
  String authors;

  Quote({String text,String authors}){
    this.text= text;
    this.authors = authors;
  }

}


class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;

  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left:16.0 ,top:16.0 ,right:16.0 ,bottom:0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 1.0), Color.fromRGBO(143, 148, 251, 0.0)
            ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[600]
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                quote.authors,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      delete();
                    }, 
                    icon: Icon(Icons.delete), 
                    label: Text("Delete"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}