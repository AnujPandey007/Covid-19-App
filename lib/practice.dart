void main () {

  // 1st way

  Function addTwoNumbers = (int a,int b) {
                             var sum = a+b;
                             print(sum);
                           };

  var multiplyByFour = (int number) {

    return number*4;
  };

  //2nd way

  Function addNumbers = (int a,int b) => print(a+b);

  var multiplyFour = (int number) => number*4;
  
  //Calling lambda function(A Function which does not have any name)

  addMyNumbers(5, 3);
  print(multiplyByFour(5));

  addNumbers(4,2);
  print(multiplyFour(2));

}

//Normal Function

void addMyNumbers(int a,int b){

  var sum = a+b;
  print(sum);

}


