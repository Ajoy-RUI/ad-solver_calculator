import 'package:flutter/material.dart';

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

  String _output = '0';
  String output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPresses(String buttonText){
    if(buttonText == 'C'){
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }
    else if(buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/'){
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    }
    else if(buttonText == '='){
      num2 = double.parse(output);



      switch(operand) {
        case '+':
          _output = (num1 + num2).toString();
          break;

        case '-':
          _output = (num1 - num2).toString();
          break;

        case '/':
          _output = (num1 / num2).toString();
          break;


        case '*':
          _output = (num1 / num2).toString();
          break;


        default:
          num1 = 0.0;
          num2 = 0.0;
          operand = '';



      }





    }
    else{
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Solver', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(output, style: const TextStyle(fontSize: 48, color: Colors.white),),
            ),

            const Divider(
              color: Colors.grey,
            ),



            Expanded(child:
            SingleChildScrollView(
                child: Column(
                    children: [
                      Row(
                        children: [
                          buildButton('7', Colors.grey[800]!),
                          buildButton('8', Colors.grey[800]!),
                          buildButton('9', Colors.grey[800]!),
                          buildButton('/', Colors.orange[800]!),
                        ],
                      ),

                      Row(
                        children: [
                          buildButton('4', Colors.grey[800]!),
                          buildButton('5', Colors.grey[800]!),
                          buildButton('6', Colors.grey[800]!),
                          buildButton('*', Colors.orange[800]!),
                        ],
                      ),


                      Row(
                        children: [
                          buildButton('1', Colors.grey[800]!),
                          buildButton('2', Colors.grey[800]!),
                          buildButton('3', Colors.grey[800]!),
                          buildButton('-', Colors.orange[800]!),
                        ],
                      ),

                      Row(
                        children: [
                          buildButton('.', Colors.grey[800]!),
                          buildButton('0', Colors.grey[800]!),
                          buildButton('C', Colors.grey[800]!),
                          buildButton('+', Colors.orange[800]!),
                        ],
                      ),

                      Row(
                        children: [
                          buildButton('=', Colors.green),
                        ],
                      )

                    ]
                )
            )

            ),





          ]
      ),

    );


  }

  Widget buildButton(String buttonText, Color buttonColor){
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(22)
          ),
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(24),
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),

              ),


              onPressed: (){
                buttonPresses(buttonText);
              }, child:
          Text(buttonText, style: const TextStyle(fontSize: 24, color: Colors.white),)

          ),
        )
    );
  }


}






















Widget buildButton(String buttonText, Color buttonColor){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(90)

      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(3),

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(25),
            backgroundColor: buttonColor,
            shadowColor: Colors.grey,
            elevation: 10,
            shape: CircleBorder(
              side: BorderSide(color: Colors.white, width: 10),
            ),

          ),






          onPressed: (){

            buttonPressed(buttonText);
          },
          child: Text(buttonText, style: TextStyle(fontSize: 24, color: Colors.black),)),
    ),

  );


}

