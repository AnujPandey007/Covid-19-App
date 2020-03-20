void main() {

  //1st way

  Map<String, int> countriesCode = {
    "INDIA":91,
    "USA": 1,
    "PAKISTAN":92
  };

  //2nd way

  Map<String, String> fruits = Map(); //Here String(1st) is Key and String(2nd) is value  -- Map<k,v>

  fruits["apple"]="red";              //Here apple is Key and red is value
  fruits["banana"]="yellow";
  fruits["guava"]="green";     

  print(fruits["apple"]);

  print("\n");

  for(String key in fruits.keys){         //Printing keys
    print(key);
  }
  print("\n");
  for(String value in fruits.values){     //Printing Values
    print(value);
  }

  print("\n");

  fruits.forEach((key, value) => print(fruits));  

  print("\n");

  fruits.update("apple", (value) => "Blue");  // Updating the data

  fruits.forEach((key, value) => print("key is $key and value is $value"));

  print("\n");

}