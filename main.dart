import 'package:arnavpractice/widgets/customButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String screenValueString = '';
  String screenValue = "";
  String operationGlobal = "";
  double firstNum = 0;
  double secondNum = 0;
  List<Widget> buttonsArray = [];

  void _screenIncrement(String numberPressed){// when to use underscore before function names(Naming Convention)?

    if(numberPressed == "backspace"){
      if(screenValue.length !=0) {
        print("1");
        screenValue = screenValue.substring(0, screenValue.length - 1);
      }
      else {
        print("2");
        screenValue = "";
      }
      setState(() {});

    }else if(screenValue == "0" || screenValue == "+" || screenValue == "-" || screenValue == "*" || screenValue == "/" ){
      screenValue = numberPressed;
      print("5");
      setState(() {});
    }else if(numberPressed == "A/C"){
      screenValue ="";
      setState(() {});
    }else{
      String temp = screenValue + numberPressed;
      screenValue= temp;
      setState(() {});
    }


  }

  void _operation(String operationSelected){
    operationGlobal = operationSelected;
    firstNum = double.parse(screenValue);
    screenValue = operationSelected;
    print(firstNum);
    setState(() {

    });
  }

   void _fetchResult(){
    print("inside fetch");
     secondNum = double.parse(screenValue);
     switch(operationGlobal){
       case '+':
         screenValue = (firstNum+secondNum).toString();
         print("+");
         break;
       case '-':
         screenValue = (firstNum-secondNum).toString();
         print("-");
         break;
       case '/':
         double tempResult = firstNum/secondNum ;
         screenValue = tempResult.toString();
         print("/"+screenValue);
         break;
       case '*':
         screenValue = (firstNum*secondNum).toString();
         print("*");
         break;
     }
     setState(() {});
   }


  @override
  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.maybeOrientationOf(context);
    print(orientation);
    buttonsArray = [];
    List<String> operationalButtonsArray = ["backspace","A/C","-","+","/","*"];
    List<Widget> operationalButtonsWidgets;
    Container calculatorScreen = Container(// add another container
      // ignore: sort_child_properties_last
        child: Container(// add another container
            child: Center(child: Text(screenValue, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 40),)),
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            width: double.maxFinite
        ),
        color: Colors.deepPurpleAccent,
        padding: const EdgeInsets.fromLTRB(40,100,40,40),
        width: double.maxFinite,
      height: screenHeight/3,
    );





    GestureDetector calculatorScreen2 = GestureDetector(
      child: Container(// add another container
        // ignore: sort_child_properties_last
          child: Container(// add another container
              child: Center(child: Text(screenValue, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 40, color: Colors.black, decoration: TextDecoration.none),)),
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              width: double.maxFinite
          ),
          color: Colors.deepPurpleAccent,
          padding: const EdgeInsets.fromLTRB(40,100,40,80),
          width: screenWidth/2,
          height: double.maxFinite
      ),
      onLongPressUp: () {
        print("hello World");
      },
    );

    double? widthRatio ;
    double height;
    if(orientation == Orientation.portrait){
      widthRatio=1;
      height = screenHeight*2/3;
    }else{
      widthRatio=1/2;
      height = screenHeight;
    }
    Row buttonsDisplay = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,



      children: [
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: Colors.black,
            height: height,
            width: screenWidth* (widthRatio)*3/4,
            child: GridView.count(
              mainAxisSpacing: 10*widthRatio,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children:  buttonsArray,

            )
        ),
        Container(
            padding: EdgeInsets.fromLTRB(0, height/12, 0, 0),
            color: Colors.black54,
            width:screenWidth* widthRatio*(1/4),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                ElevatedButton.icon(onPressed: ()=> _screenIncrement("backspace"), onLongPress: ()=>_screenIncrement("A/C"),icon: Icon(Icons.backspace) ,label: Text("")),
                ElevatedButton(onPressed: ()=> _screenIncrement("A/C"), child: Text('A/C')),
                ElevatedButton(onPressed: ()=> _operation("-"), child: Text('-')),
                ElevatedButton(onPressed: ()=> _operation("+"), child: Text('+')),
                ElevatedButton(onPressed: ()=> _operation("/"), child: Text('/')),
                ElevatedButton(onPressed: ()=> _operation("*"), child: Text('*')),
                ElevatedButton(onPressed: ()=> _fetchResult(), child: Text('=')),
              ],

             )
         )
      ]
    );
    // Column operationalButtonsDisplay = Column(
    //   children: [
    //     operationalButtons
    //   ],
    // )

    MaterialApp potraitView = MaterialApp(
      home: Scaffold(
          body: Column(
            children: [calculatorScreen, buttonsDisplay],

          )
      ),
    );
    
    MaterialApp horizontalView = MaterialApp(
      home:  Row(
            children: [calculatorScreen2,buttonsDisplay], // add buttonsDisplay

          )
      );
    int j = 1;
    for(int i=1; i<10; i++){
        buttonsArray.add(CustomButton(onPressedFunction: () => _screenIncrement('$i'), buttonText: '$i', btnColor: Colors.grey));
    }
    buttonsArray.add(CustomButton(onPressedFunction: () => _screenIncrement('0'), buttonText: '0', btnColor: Colors.grey));
    buttonsArray.add(CustomButton(onPressedFunction: ()=> _screenIncrement("00"), buttonText: "00", btnColor: Colors.grey));

    // for(int i =0; i< operationalButtonsArray.length; i++){
    //   operationalButtonsWidgets.add(CustomButton(onPressedFunction: onPressedFunction, buttonText: buttonText, btnColor: btnColor))
    // }

  return OrientationBuilder(
      builder: (context, orientation){
    if(orientation == Orientation.portrait)
      return potraitView;
    else
      return horizontalView;
    });

  }
}
//**use custom widgets: component based structure
//





