import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const  calculatorApp());
}

class calculatorApp extends StatelessWidget{
  const calculatorApp({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}


class CalculatorScreen extends StatefulWidget{
  const CalculatorScreen({super.key});

  @override
    State<CalculatorScreen> createState() => _CalculatorScreenState();
  }

class _CalculatorScreenState extends State<CalculatorScreen> {


  String display = '0';

  int Flex = 1;


  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == 'C'){
        display = '0';
      }

      else if(buttonText == 'del'){
        if(display.length > 1){
          display = display.substring(0, display.length - 1);
        }
        else{
          display = '0';
        }

      }

      else if(buttonText == '='){
        try{
          String finalExpression = display;
          finalExpression = finalExpression.replaceAll('π', '3.14159265');
          finalExpression = finalExpression.replaceAll('e', '2.718281828');

          GrammarParser p = GrammarParser();
          Expression exp = p.parse(finalExpression);


          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          display = eval.toString();

          if(display.endsWith('.0')){
            display = display.substring(0, display.length - 2);
          }

        }
        catch (e){
          display = "Error";

        }




      }
      else{
        if (display == '0' && buttonText != '.'){
          display = buttonText;
        }
        else{
          display += buttonText;
        }
      }





    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Solver', style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold, fontSize: 35, shadows: [
          Shadow(
            blurRadius: 5,
            color: Colors.blueGrey,
            offset: Offset(1, 1),
          )
        ]),),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(display, style: TextStyle(fontSize: 50, color: Colors.black),),





          ),


          const Divider(
              color: Colors.white70
          ),



          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton('C', Colors.orange[400]!),
                      buildButton('π', Colors.orange[200]!),
                      buildButton('e', Colors.orange[200]!),
                      buildButton('*', Colors.purple[300]!),




                    ]
                  ),

                  Row(
                      children: [
                        buildButton('7', Colors.grey[200]!),
                        buildButton('8', Colors.grey[200]!),
                        buildButton('9', Colors.grey[200]!),
                        buildButton('/', Colors.purple[300]!),




                      ]
                  ),


                  Row(
                      children: [
                        buildButton('4', Colors.grey[200]!),
                        buildButton('5', Colors.grey[200]!),
                        buildButton('6', Colors.grey[200]!),
                        buildButton('-', Colors.purple[300]!),




                      ]
                  ),


                  Row(
                      children: [
                        buildButton('1', Colors.grey[200]!),
                        buildButton('2', Colors.grey[200]!),
                        buildButton('3', Colors.grey[200]!),
                        buildButton('+', Colors.purple[300]!),




                      ]
                  ),


                  Row(
                      children: [
                        buildButton('.', Colors.grey[400]!),
                        buildButton('0', Colors.grey[200]!),
                        buildButton('del', Colors.grey[200]!),
                        buildButton('=', Colors.deepPurple[400]!),




                      ]
                  ),


                ]
            )
          ),



      ),
    ])

    );
  }









  Widget buildButton(String buttonText, Color buttonColor){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 14,
            ),

            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(4, 4),
              blurRadius: 10,
            ),

          ],

        ),

        child: Material(
          animationDuration: Duration(milliseconds: 800),
          animateColor: true,
          borderOnForeground: true,
          //surfaceTintColor: Colors.red,

          color: Colors.transparent,
          shape: CircleBorder(),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: (){
              buttonPressed(buttonText);

            },
            child: Padding(padding: EdgeInsets.all(22),
              child: Center(
                child: Text(buttonText, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),),

              ),

        )
          )
        )
      ),

    );


  }
}