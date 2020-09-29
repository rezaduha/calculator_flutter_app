import 'package:flutter/material.dart';
import 'package:calculator_flutter_app/components/display.dart';
import 'package:calculator_flutter_app/components/operator.dart';
import 'package:calculator_flutter_app/components/numpad.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _txtCalculation = "0";
  String _txtResult = "0";
  String _expression = "";

  RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

// String s = num.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");

  btnPressed(String btnText) {
    setState(() {
      if (btnText == "C") {
        _txtCalculation = "0";
        _txtResult = "0";
      } else if (btnText == "⌫") {
        _txtCalculation =
            _txtCalculation.substring(0, _txtCalculation.length - 1);

        if (_txtCalculation == "") {
          _txtCalculation = "0";
        }
      } else if (btnText == "=") {
        _expression = _txtCalculation;
        _expression = _expression.replaceAll('×', '*');
        _expression = _expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          _txtResult = '${exp.evaluate(EvaluationType.REAL, cm)}';
          _txtResult = _txtResult.replaceAll(regex, "");
        } catch (e) {
          _txtResult = "⚠️Error";
        }
      } else {
        if (_txtCalculation == "0") {
          _txtCalculation = btnText;
        } else {
          _txtCalculation += btnText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Display(_txtCalculation, _txtResult),
            Expanded(
                child: Divider(
              color: Colors.transparent,
            )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      children: [
                        FittedBox(
                          child: Container(
                            child: Row(
                              children: [
                                Operator("C", 1, btnPressed),
                                Operator("⌫", 1, btnPressed),
                                Operator("÷", 1, btnPressed),
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8, 5, 0, 10),
                            decoration: BoxDecoration(
                                color: Color(0xFF222222),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(-1, 2))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Numpad("7", 1, btnPressed),
                                    Numpad("8", 1, btnPressed),
                                    Numpad("9", 1, btnPressed)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Numpad("4", 1, btnPressed),
                                    Numpad("5", 1, btnPressed),
                                    Numpad("6", 1, btnPressed)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Numpad("1", 1, btnPressed),
                                    Numpad("2", 1, btnPressed),
                                    Numpad("3", 1, btnPressed)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Numpad(".", 1, btnPressed),
                                    Numpad("0", 1, btnPressed),
                                    Numpad("00", 1, btnPressed)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          Operator("×", 1, btnPressed),
                        ]),
                        TableRow(children: [
                          Operator("-", 1, btnPressed),
                        ]),
                        TableRow(children: [
                          Operator("+", 1, btnPressed),
                        ]),
                        TableRow(children: [
                          Operator("=", 2, btnPressed),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
