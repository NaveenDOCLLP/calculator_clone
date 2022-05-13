import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';

  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  buttonPressed(String buttonText) {
    print(buttonText);
    if (buttonText == 'AC') {
       _output = '0';
       num1 = 0;
       num2 = 0;
       operand = "";
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'X' ||
        buttonText == '/' ||
        buttonText == '%') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (_output.contains('.')) {
      // print('Already contains a decimal');
      return;
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '%') {
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.all(23),
        textColor: Colors.white,
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: buttonColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              // color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                output,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.7,
              endIndent: 30,
              indent: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton('AC', Colors.orange),
                    IconButton(
                        onPressed: () {
                          print(_output);
                          _output = _output.substring(0, _output.length -1);
                        },
                        icon: const Icon(
                          Icons.backspace_outlined,
                          color: Colors.orange,
                        )),
                    buildButton('%', Colors.orange),
                    buildButton('/', Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    buildButton('7', Colors.white),
                    buildButton('8', Colors.white),
                    buildButton('9', Colors.white),
                    buildButton('X', Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    buildButton('4', Colors.white),
                    buildButton('5', Colors.white),
                    buildButton('6', Colors.white),
                    buildButton('-', Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    buildButton('1', Colors.white),
                    buildButton('2', Colors.white),
                    buildButton('3', Colors.white),
                    buildButton('+', Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    buildButton('00', Colors.white),
                    buildButton('0', Colors.white),
                    buildButton('.', Colors.white),
                    buildButton('=', Colors.orange)
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
