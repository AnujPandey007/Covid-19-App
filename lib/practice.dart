void main() {
  String message="Dart";
  print(message);

  Function showMessage = () {
    message = "Dart is awesome";
    print(message);
  };

  showMessage();

  Function talk = () {
    String msg = "Hi";
    print(msg);

    Function say = (){
      msg = "hello";
      print(msg);
    };

    return say;

  };

  

  var speak = talk();
  speak();
  
}



