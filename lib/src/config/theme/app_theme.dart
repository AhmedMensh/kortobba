import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme:  const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      colorScheme: const ColorScheme.light(primary: Colors.black,secondary: kBLUE_700),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      fontFamily: 'Al-Jazeera',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Colors.black),
        headline3: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline4: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.black),
        headline5: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),
        headline6: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.black),
        bodyText1: TextStyle(fontSize: 14.0,color: Colors.black,fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 12.0,color: Colors.black,fontWeight: FontWeight.w400),

      ),
    );
  }
}