import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  String _txtButton;
  double _btnHeight;
  final Function _onClick;

  Numpad(this._txtButton, this._btnHeight, this._onClick);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1 * _btnHeight,
        margin: EdgeInsets.all(6),
        child: FlatButton(
            onPressed: () => _onClick(_txtButton),
            child: AutoSizeText(
              _txtButton,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )),
      ),
    );
  }
}
