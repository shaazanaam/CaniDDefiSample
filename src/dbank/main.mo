import Debug "mo:base/Debug";



// a class that can hold the canister is called the actor
// The debug function will help us let the Text come out into the terminal
// mo is for motoko : base is for the base library and the forward slash D is for the debug module
// in order for the code to run we will have to deploy the canister.
// Here we have seen how the current value has been declared using the constant 
// How to import the debug using the current_value 

actor DBank{
  var currentValue =300;
  currentValue :=100;
  let id = 232132132132132;
  

 // Debug.print(debug_show(id));

  public func topUp(amount: Nat){
    currentValue +=amount;
    Debug.print(debug_show(currentValue))
  };
  //topUp();

  public func withdraw(amount: Nat){
    currentValue -= amount;
     Debug.print(debug_show(currentValue))
  };

}