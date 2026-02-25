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
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 91, 89, 89),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("C",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 91, 89, 89),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("±",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 91, 89, 89),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("%",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("/",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),
            // 7, 8, 9, and Multoplication Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("7",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("8",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("9",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("x",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),
            // 4, 5, 6, and Subtraction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("4",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("5",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("6",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("-",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),
            // 1, 2, 3, and Addition Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("1",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("2",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("3",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("+",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
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
                Expanded(child:
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 69, 67, 67),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(".",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(child:
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text("=",
                      style: TextStyle(
                        fontSize: 50.0
                      ),
                    )
                  ),
                ),
              ],
            ),    
          ],
        ),
      )
    );
  }
}