import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
    ),
    home: CalculatorApp(),
  ),
);

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
      displayText += (newOp == '*') ? '×' : newOp; // show the expression being built (e.g., "12+")
    });
  }

  // Helper function to find index of the operator
  // If operator is '-', we skip index 0 so we don't mistake a 
  // leading negative sign as the operator
  int findOperatorIndex() {
    if (_operator == null) return -1;

    final opCharOnScreen = (_operator == '*') ? '×' : _operator!;

    if (_operator == '-') {
      return displayText.indexOf('-', 1);
    }

    return displayText.indexOf(opCharOnScreen);
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

    final operatorIndex = findOperatorIndex();
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

    // Remove trailing unecessary trailing 0
    setState(() {
      final s = result.toString();
      displayText = s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
    });
    _operand1 = null; _operator = null;
  }

  void toggleSign() {
    setState(() {
      if (displayText.isEmpty) return;

      // If we have an operator, toggle the RIGHT operand only
      if (_operator != null) {
        final idx = findOperatorIndex();
        if (idx == -1) return;

        final left = displayText.substring(0, idx + 1); // includes operator
        final right = displayText.substring(idx + 1);

        // If right side empty, start a negative number (one '-')
        if (right.isEmpty) {
          displayText = left + '-';
          return;
        }

        // Toggle exactly one leading '-'
        if (right.startsWith('-')) {
          displayText = left + right.substring(1);
        } else {
          displayText = left + '-' + right;
        }
        return;
      }

      // No operator: toggle whole number
      if (displayText.startsWith('-')) {
        displayText = displayText.substring(1);
      } else {
        displayText = '-' + displayText;
      }
    });
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
  // Checks each operand to ensure there no more than one
  // decimal.
  void append(String s) {
    setState(() {
      if (s == '.') {
        if (_operator == null) {
          // First operand
          if (displayText.contains('.')) return;
        } else {
          // Second operand
          final idx = findOperatorIndex();
          if (idx != -1) {
            final right = displayText.substring(idx + 1);
            if (right.contains('.')) return;
          }
        }
      }
      displayText += s;
    });
  }

  // Deletes the last character in display Text
  // Checks if the last char is the operator, and clears operator state too
  void backspace() {
    if (displayText.isEmpty) return;

    setState(() {
      final lastChar = displayText[displayText.length - 1];
      final opCharOnScreen = (_operator == '*') ? '×' : _operator;

      if (opCharOnScreen != null && lastChar == opCharOnScreen) {
        _operator = null;
        _operand1 = null;
      }

      displayText = displayText.substring(0, displayText.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('',
        style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.white,
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
                color: Colors.white,
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
                firstRowButtons('del', ()=>backspace()),

                const SizedBox(width: 10,),
                firstRowButtons('±', ()=>toggleSign()),

                const SizedBox(width: 10,),
                operatorBttn('÷', ()=> setOperator('/'))
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
                operatorBttn('×', () => setOperator('*'))
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