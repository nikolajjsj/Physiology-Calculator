import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    this.onPressed,
    this.tag,
  });

  final Function onPressed;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Hero(
        tag: tag,
        child: RaisedButton(
          color: Colors.red[300],
          child: Text('Close'),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
