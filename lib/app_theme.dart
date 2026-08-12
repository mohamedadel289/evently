
import 'package:flutter/material.dart';

class AppTheme {
 static const Color primaryLight =Color(0xFF0E3A99);
 static const Color primaryDark =Color(0xFF457AED);
 static const Color backgroundLight =Color(0xFFF4F7FF);
 static const Color backgroundDark =Color(0xFF000F30);
 static const Color white =Color(0xFFFFFFFF);
 static const Color grey =Color(0xFFB9B9B9);
 static const Color darkgray =Color(0xFF686868);
 static const Color black =Color(0xFF1C1C1C);
 static const Color red =Color(0xFFFF3232);
 static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: backgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryLight,
    titleTextStyle: TextStyle(
      color: black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    centerTitle: true,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: white,
    selectedItemColor: primaryLight,
    unselectedItemColor: grey,

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryLight,
  ),
 );
 static ThemeData darkTheme = ThemeData(
  

  
 );
 

}