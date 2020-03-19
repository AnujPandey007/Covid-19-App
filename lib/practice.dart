void main() {

  //Example 1: Passing Function to higher order function
  Function addNumbers = (int a,int b) => print(a+b);
  someOtherFunction("anuj", addNumbers);

  //Example 2: Receiving Function from higher order function
  var myFun = taskToPerform();
  print(myFun(4));

}

//Higher Order Function:--


//Example one: Accepts Function as parameters
void someOtherFunction(String message, Function myFunction) {         //Higher Order Function
  print(message);
  print(myFunction(2,4));

}

//Example two: Returns a Function
Function taskToPerform() {                                              //Higher Order Function

  Function multiplyFour = (int number) => number*4;
  return multiplyFour;
}