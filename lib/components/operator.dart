import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Operator extends StatelessWidget {
  String _txtButton;
  double _btnHeight;
  final Function _onClick;

  Operator(this._txtButton, this._btnHeight, this._onClick);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1 * _btnHeight,
        margin: EdgeInsets.fromLTRB(7, 10, 7, 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: FlatButton(
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xFF222222),
            onPressed: () => _onClick(_txtButton),
            child: AutoSizeText(
              _txtButton,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Colors.yellowAccent),
            ),
          ),
        ),
      ),
    );
  }
}
