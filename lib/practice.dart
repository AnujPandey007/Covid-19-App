void main(){

// 1st way 

Set<String> country = Set.from(["INDIA", "USA","CHINA"]);
country.add("JAPAN");

country.forEach((String element) {
  print(element);
});

//2nd way

Set<int> numberSet = Set();  // List is of integer and its growable list
numberSet.add(73);                  
numberSet.add(64);
numberSet.add(21);                    // List is nothing but array
numberSet.add(12);

print(numberSet.length);

print("\n");

for(int element in numberSet){         //Printing value from for-each loop

  print(element);
}

print("\n");

numberSet.forEach((int elements)=>print(elements));   //Using Lambda function


print("\n");


}


