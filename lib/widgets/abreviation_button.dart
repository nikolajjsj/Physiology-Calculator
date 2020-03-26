import 'package:flutter/material.dart';

class AbreviationButton extends StatelessWidget {
  AbreviationButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Text('Abreviations'),
      textColor: Colors.white,
      color: Colors.redAccent[100],
      onPressed: onPressed,
    );
  }
}
