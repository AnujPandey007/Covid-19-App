void main(){

// 1st way 

List<String> country = ["INDIA", "USA","CHINA"];  
country.add("JAPAN");
country.forEach((String element) {
  print(element);
});

//2nd way

List<int> numberList = List();  // List is of integer and its growable list
numberList.add(73);                  
numberList.add(64);
numberList.add(21);                    // List is nothing but array
numberList.add(12);



numberList[0]= 99;                    // Value changed from 73 to 99
numberList[1]= null;                  //Value changed from 64 to null


print(numberList[0]);
print(numberList[1]);

numberList.remove(99);
numberList.add(50);
numberList.clear(); // to clear all elements

print("\n");

for(int element in numberList){         //Printing value from for-each loop

  print(element);
}

print("\n");

numberList.forEach((int elements)=>print(elements));   //Using Lambda function


print("\n");

int i;

for(i=0; i<numberList.length; i++)
{
  print(numberList[i]);                       //Using for loop(Using index)

}


}


