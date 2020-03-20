void main(){

  var personOne = Person();
  var msg = personOne(25, "Peter");
  print(msg);

}

class Person{

  String call(int age, String name){
    return "Age : $age and name :$name";
    
  }

}

