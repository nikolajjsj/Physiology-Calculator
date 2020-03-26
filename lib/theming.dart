import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red[300],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red[300],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  // textTheme: TextTheme(
  //   display1: TextStyle(
  //     fontFamily: 'OpenSans',
  //   ),
  // ),
);

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  isDarkTheme() {
    if (_themeData == darkTheme) {
      return true;
    }
    if (_themeData == lightTheme) {
      return false;
    }
  }

  cardColor() {
    if (_themeData == darkTheme) {
      return Colors.grey[700];
    }
    if (_themeData == lightTheme) {
      return Colors.blue[50];
    }
  }
}
