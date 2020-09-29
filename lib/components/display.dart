import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  String _txtCalculation;
  String _txtResult;

  Display(this._txtCalculation, this._txtResult);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: AutoSizeText(
              _txtResult,
              style: TextStyle(fontSize: 84, color: Colors.yellow),
              maxLines: 1,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient:
                    LinearGradient(colors: [Colors.purple, Colors.yellow]),
              ),
              child: AutoSizeText(
                _txtCalculation,
                style: TextStyle(fontSize: 28, color: Colors.black),
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
