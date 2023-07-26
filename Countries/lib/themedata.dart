import 'package:shared_preferences/shared_preferences.dart';

class Themepref{
  static const THEME = "THEME";


  void setTheme(bool value) async{
    SharedPreferences mypref = await SharedPreferences.getInstance();
    mypref.setBool(THEME, value);
  }

  Future<bool> getTheme() async{
    SharedPreferences mypref = await SharedPreferences.getInstance();
    return mypref.getBool(THEME) ?? false;
  }
}