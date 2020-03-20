void main(){

List<int> numberList = List(5);  // List is of integer and can store 5 elements
numberList[0]= 73;                   // List is nothing but array
numberList[1]= 64;
numberList[3]= 21;
numberList[4]= 12;   


numberList[0]= 99;                    // Value changed from 73 to 99
numberList[1]= null;                  //Value changed from 64 to null


print(numberList[0]);
print(numberList[1]);

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


