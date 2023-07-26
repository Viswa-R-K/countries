import 'package:flutter/material.dart';


class Styles{
  static ThemeData themeData(bool isDark,BuildContext context){
    return isDark? ThemeData.dark() : ThemeData.light();
  }
}
