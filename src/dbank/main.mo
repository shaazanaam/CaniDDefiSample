import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";




// a class that can hold the canister is called the actor
// The debug function will help us let the Text come out into the terminal
// mo is for motoko : base is for the base library and the forward slash D is for the debug module
// in order for the code to run we will have to deploy the canister.
// Here we have seen how the current value has been declared using the constant 
// How to import the debug using the current_value 

actor DBank{
  stable var currentValue: Float =300;
  //currentValue :=300;
  
  stable var startTime =Time.now();
  //startTime :=Time.now();
  Debug.print(debug_show(startTime));
  
  

 // Debug.print(debug_show(id));

  public func topUp(amount: Float){
    currentValue +=amount;
    Debug.print(debug_show(currentValue))
  };
  //topUp();

  public func withdraw(amount: Float){
      let tempValue: Float = currentValue- amount;
    if (tempValue >=0){
      currentValue -= amount;
     Debug.print(debug_show(currentValue))
    } else {
      Debug.print("AMount too large, currentValue less than 0 ")
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };
  // topUp

  // this is not the query function 

  public func compound(){
    let currentTime =Time.now();
    let timeElapsedNS = currentTime -startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue*(1.01** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}