import 'package:flutter/material.dart';

void main() =>runApp(Myapp());

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: calculator(),
    );
  }
}
class calculator extends StatefulWidget {




  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {


    dynamic displaytxt=20;

  Widget buttons(String text,Color buttoncolor, Color textcolor){

    return SizedBox( 
      height: 100,width: 100,
      child: ElevatedButton(onPressed: (){
        //TODO add function for button press
           calculate(text);
      },
      
      
      
      
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
          ,
        ) 
        , 
        child: Text(text,
      style:TextStyle(fontSize: 35, color:textcolor,
      ),
      
      
      
      )

      ),
      

    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(title: Text('Calculator'),titleTextStyle: TextStyle(color: Colors.yellow),centerTitle: true,backgroundColor: Colors.black,),
      body: Padding(
      
      padding: EdgeInsets.symmetric(horizontal: 6),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding:EdgeInsets.all(10.0),
              child : Text('$text',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white,
              fontSize: 100)
              )
              
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
            children: [
              //buttons function called here

            buttons('AC', Colors.grey, Colors.black),
            buttons('+/-', Colors.grey, Colors.black),
            buttons('%', Colors.grey, Colors.black),
            buttons('/',Colors.amber.shade700, Colors.white),


            ],

          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
            children: [
              //buttons function called here

            buttons('7', Colors.grey.shade900, Colors.white),
            buttons('8', Colors.grey.shade900, Colors.white),
            buttons('9', Colors.grey.shade900, Colors.white),
            buttons('x',Colors.amber.shade700, Colors.white),


            ],

          ),
           const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
            children: [
              //buttons function called here

            buttons('4', Colors.grey.shade900, Colors.white),
            buttons('5', Colors.grey.shade900, Colors.white),
            buttons('6', Colors.grey.shade900, Colors.white),
            buttons('-',Colors.amber.shade700, Colors.white),


            ],

          ),
           const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
            children: [
              //buttons function called here

            buttons('1', Colors.grey.shade900, Colors.white),
            buttons('2', Colors.grey.shade900, Colors.white),
            buttons('3', Colors.grey.shade900, Colors.white),
            buttons('+',Colors.amber.shade700, Colors.white),


            ],

          ),

           const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
            children: [
              //buttons function called here
              
        ElevatedButton(onPressed: (){
        
        //TODO add function for button press
        calculate('0');
           
      },
      
      
      
      
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade900,
          minimumSize: Size(210, 100),
          shape: StadiumBorder(
            
          )
        ) 
        , 
        child: Text(('0'),
      style:TextStyle(fontSize: 35, color:Colors.white,
      ),
      
      
      
      )

      ),
            buttons('.', Colors.grey.shade900, Colors.white),
            buttons('=',Colors.amber.shade700, Colors.white),


            ],

          ),
        ],
      ),

      )
    );
  }
  //logic goes here
   //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculate(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }

}