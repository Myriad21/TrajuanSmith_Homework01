import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CalculatorApp(),
));

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
  
}

class _CalculatorAppState extends State<CalculatorApp> {
  String displayText ="";
  double? _operand1;
  String? _operator;
  bool startNewExpression=false;

  void setOperator(String newOp) {
    final n = double.tryParse(displayText);
    if (n == null) return;

    _operand1 = n;
    _operator = newOp;

    setState(() {
      displayText += newOp; // show the expression being built (e.g., "12+")
    });
  }

  // This function evaluates the expression in displayText
  // First checks if the 1st operand is null or if the operator is null, if not move on
  // Next checks if the operator stored is actually in displayText, if yes save the 
    // index to be used later, If not do not move on.
  // Next checks for the 2nd operand using the index of the operator, if the operand
  // is not found do not move on.

  // Then uses the operator in a switch statement to complete the calculations and 
  // returns the result in displayText.
  void evaluateExpression() {
    if (_operand1==null || _operator ==null) {return;}

    final operatorIndex = displayText.indexOf(_operator!);
    if (operatorIndex == -1) {return;}

    final rightStr = displayText.substring(operatorIndex +1);
    final _operand2 = double.tryParse(rightStr);
    if (_operand2==null) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Incomplete Expression"),
          content: Text("Input your 2nd Operand"),
        ),
      );
      return;
    }

    double result;
    switch (_operator!) {
      case '+': result = _operand1! + _operand2; 
        break;
      case '-': result = _operand1! - _operand2;
        break;
      case '*': result = _operand1! * _operand2;
        break;
      case '/': 
        if (_operand2 == 0) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Division by Zero Error"),
              content: Text("You cannot divide by Zero."),
            ),
          );
          setState(() {
            displayText = '';
          });
          _operand1 = null; _operator =null;
          return;
        }
        result = _operand1!/_operand2;
        break;
      default:
        return;
    }
    setState(() {
      displayText = result.toString();
    });
    _operand1 = null; _operator = null;
  }


  // Helper functions to define the buttons 
  Widget numberBttn(String t, VoidCallback onTap) => Expanded(
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 69, 67, 67),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(t, style: const TextStyle(fontSize: 50)),
    ),
  );

  Widget operatorBttn(String t, VoidCallback onTap) => Expanded(
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(t, style: const TextStyle(fontSize: 50)),
    ),
  );

  Widget firstRowButtons(String t, VoidCallback onTap) => Expanded(
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 91, 89, 89),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(t, style: const TextStyle(fontSize: 50)),
    ),
  );

  // Append text to displayText
  void append(String s){
    setState(() {
      displayText += s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calc'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                alignment: Alignment.centerRight,
                child: Text(
                  displayText,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 60
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10,),

            // Clear, +/-, %, and Division Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                firstRowButtons("C", () {
                  setState(()=> displayText='');
                    _operand1 = null;
                    _operator = null;
                }),

                const SizedBox(width: 10,),
                firstRowButtons('±', (){}),
                
                const SizedBox(width: 10,),
                firstRowButtons('%', () => append('%')),

                const SizedBox(width: 10,),
                operatorBttn('/', ()=> setOperator('/'))
              ],
            ),

            const SizedBox(height: 10,),
            // 7, 8, 9, and Multoplication Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('7', ()=>append('7')),

                const SizedBox(width: 10,),
                numberBttn('8', () => append('8')),

                const SizedBox(width: 10,),
                numberBttn('9', () => append('9')),

                const SizedBox(width: 10,),
                operatorBttn('x', () => setOperator('*'))
              ],
            ),

            const SizedBox(height: 10,),
            // 4, 5, 6, and Subtraction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('4', () => append('4')),

                const SizedBox(width: 10,),
                numberBttn('5', () => append('5')),

                const SizedBox(width: 10,),
                numberBttn('6', () => append('6')),

                const SizedBox(width: 10,),
                operatorBttn('-', () => setOperator('-'))
              ],
            ),

            const SizedBox(height: 10,),
            // 1, 2, 3, and Addition Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('1', () => append('1')),

                const SizedBox(width: 10,),
                numberBttn('2', () => append('2')),

                const SizedBox(width: 10,),
                numberBttn('3', () => append('3')),

                const SizedBox(width: 10,),
                operatorBttn('+', () {
                  setOperator('+');
                })
              ],
            ),

            const SizedBox(height: 10,),
            // 0, ., = Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => append('0'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("0",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                numberBttn('.', () => append('.')),

                const SizedBox(width: 10,),
                operatorBttn('=', () => evaluateExpression())
              ],
            ),    
          ],
        ),
      )
    );
  }
}