// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const calapp());
}

class calapp extends StatelessWidget {
  const calapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calui(),
    );
  }
}

class calui extends StatefulWidget {
  const calui({super.key});

  @override
  State<calui> createState() => _caluiState();
}

class _caluiState extends State<calui> {
  String Equation = '0';
  String Result = '0';
  String expression = '';

  buttonPressed(btntxt) {
    setState(() {
      if (btntxt == 'AC') {
        Equation = '0';
        Result = '0';
      } else if (btntxt == '⌫') {
        Equation = Equation.substring(0, Equation.length - 1);
        if (Equation == '') {
          Equation = '0';
        }
      } else if (btntxt == '=') {
        expression = Equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          Result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'ERROR';
        }
      } else {
        if (Equation == '0') {
          Equation = btntxt;
        } else
          Equation = Equation + btntxt;
      }
    });
  }

  Widget calbutton(
      String btntext, Color txtcolr, double btnwith, Color btncolr) {
    return InkWell(
      onTap: () {
        buttonPressed(btntext);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnwith,
        decoration: BoxDecoration(
          color: btncolr,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          btntext,
          style: TextStyle(
              color: txtcolr, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[100],
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 36, 53)),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          height: 90,
          width: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Text(
              Equation,
              style: TextStyle(color: Colors.white, fontSize: 38),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerRight,
          height: 90,
          width: double.infinity,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Text(
              Result,
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calbutton(
                      'AC', Colors.white, 80, Color.fromARGB(255, 211, 71, 71)),
                  calbutton('⌫', Colors.white, 80, Colors.green[100]!),
                  calbutton('%', Colors.white, 80,
                      Color.fromARGB(255, 114, 105, 240)),
                  calbutton(
                      '÷', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calbutton('7', Colors.white, 80, Colors.white38),
                  calbutton('8', Colors.white, 80, Colors.white38),
                  calbutton('9', Colors.white, 80, Colors.white38),
                  calbutton(
                      '×', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calbutton('4', Colors.white, 80, Colors.white38),
                  calbutton('5', Colors.white, 80, Colors.white38),
                  calbutton('6', Colors.white, 80, Colors.white38),
                  calbutton(
                      '-', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calbutton('1', Colors.white, 80, Colors.white38),
                  calbutton('2', Colors.white, 80, Colors.white38),
                  calbutton('3', Colors.white, 80, Colors.white38),
                  calbutton(
                      '+', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calbutton('0', Colors.white, 170, Colors.white38),
                  calbutton('9', Colors.white, 80, Colors.white38),
                  calbutton(
                      '=', Colors.white, 80, Colors.deepOrangeAccent[100]!),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
