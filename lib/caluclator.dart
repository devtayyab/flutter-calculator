// import 'dart:convert';
import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(textt) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
          
            foregroundColor: MaterialStateProperty.all<Color>(Colors.yellowAccent),
      //  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(4),
        shape: MaterialStateProperty.all<OutlinedBorder>(OutlinedBorder(side: )),
          ),
          onPressed: () {
            setState(() {
              result = result + textt;
            });
          },
          child: Text(textt)),
    );
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  ans() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
    setState(() {
      result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(5),
                child: Container(
                  // constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.4),
                      image: DecorationImage(
                          image: AssetImage("assets/Mosque.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(children: [
                    Text(result,
                        style: TextStyle(
                          wordSpacing: 7,
                          letterSpacing: 5,
                          fontSize: 50,
                          color: Colors.black,
                        )),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            btn("1"),
                            btn("2"),
                            btn("3"),
                            btn("4"),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        btn("5"),
                        btn("6"),
                        btn("7"),
                        btn("8"),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btn("9"),
                          btn("0"),
                          btn("+"),
                          btn("-"),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          btn("*"),
                          btn("/"),
                          ElevatedButton(
// 
                            onPressed: clearr,
                            child: Text("Clear"),
                          ),
                          ElevatedButton(
                            onPressed: ans,
                            child: Text("="),
                          ),
                        ]),
                  ]),
                ))));
  }
}
