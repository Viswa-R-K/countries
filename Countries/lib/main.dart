import 'package:countries/pages/homePage.dart';
import 'package:countries/styles.dart';
import 'package:countries/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDark = false;

  ThemeProvider themeChangeProvider = ThemeProvider();

  void getCurrentTheme() async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.themePrefs.getTheme();
  }


  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,ThemeProvider,child){
          return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
            theme: Styles.themeData(ThemeProvider.getDarkTheme, context),
          );
        }
      ),
    );
  }
}
