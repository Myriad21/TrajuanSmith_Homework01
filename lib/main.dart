import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CalculatorApp(),
));

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
  
}

class _CalculatorAppState extends State<CalculatorApp> {
  String displayText ="1+1";


  // Helper functions to define the buttons
  // 

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
                firstRowButtons("C", () => setState(()=> displayText='')),

                const SizedBox(width: 10,),
                firstRowButtons('±', (){}),
                
                const SizedBox(width: 10,),
                firstRowButtons('%', () => setState(() => displayText+='%')),

                const SizedBox(width: 10,),
                operatorBttn('/', (){})
              ],
            ),

            const SizedBox(height: 10,),
            // 7, 8, 9, and Multoplication Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('7', (){}),

                const SizedBox(width: 10,),
                numberBttn('8', (){}),

                const SizedBox(width: 10,),
                numberBttn('9', (){}),

                const SizedBox(width: 10,),
                operatorBttn('x', (){})
              ],
            ),

            const SizedBox(height: 10,),
            // 4, 5, 6, and Subtraction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('4', (){}),

                const SizedBox(width: 10,),
                numberBttn('5', (){}),

                const SizedBox(width: 10,),
                numberBttn('6', (){}),

                const SizedBox(width: 10,),
                operatorBttn('-', (){})
              ],
            ),

            const SizedBox(height: 10,),
            // 1, 2, 3, and Addition Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                numberBttn('1', (){}),

                const SizedBox(width: 10,),
                numberBttn('2', (){}),

                const SizedBox(width: 10,),
                numberBttn('3', (){}),

                const SizedBox(width: 10,),
                operatorBttn('+', (){})
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
                    onPressed: (){},
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
                numberBttn('.', (){}),

                const SizedBox(width: 10,),
                operatorBttn('=', (){})

              ],
            ),    
          ],
        ),
      )
    );
  }
}