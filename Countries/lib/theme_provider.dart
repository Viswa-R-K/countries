
import 'package:countries/themedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  Themepref themePrefs = Themepref();

  bool darkTheme = false;

  bool get getDarkTheme => darkTheme;
  set setDarkTheme(bool value){
    darkTheme = value;
    themePrefs.setTheme(value);
    notifyListeners();
  }
}