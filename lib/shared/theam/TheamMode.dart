import 'package:flutter/material.dart';
import 'package:todosql/shared/color/color.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: AppBarTheme(
      color: primaryColor,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      selectedItemColor: Colors.white,
    ),
  );
}
