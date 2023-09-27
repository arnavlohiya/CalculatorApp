import "package:flutter/material.dart";
//this is a custom button
//class name also start with a capital letter
class CustomButton extends StatelessWidget{

  // String buttonText;
  // CustomButton(String buttonText, ){
  //   this.buttonText = buttonText;
  // }

  //if a constr. is only allocating values to the variables, there is a better way to do it:

  CustomButton({required this.onPressedFunction, required this.buttonText, required this.btnColor});
  final Color btnColor;
  final String buttonText; //why is this after the constr? cuz standard practice is to write constr. as the first line of a class.
  final VoidCallback onPressedFunction;
  // What is VoidCallBack? is it a type of a function?
  /// Signature of callbacks that have no arguments and return no data.

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: onPressedFunction,
        child: Text(buttonText, style: TextStyle(fontSize: 30, color: Colors.white )),
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)), backgroundColor: btnColor, )
    );
  }

}
//ElevatedButton(onPressed: ()=>_screenIncrement("1"), child: Text('1', style: TextStyle(fontSize: 20)))

//Arrow function: it's basically an anonymous function

//how to pass an arrow function as a param. ?
  //- void callback
    // what is callback: a function that we dont explicitly call in the code but it'll be called automatically upon certain circumstances.