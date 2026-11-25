import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF0E3A99);
  static const Color primaryDark = Color(0xFF457AED);
  static const Color backgroundLight = Color(0xFFF4F7FF);
  static const Color backgroundDark = Color(0xFF000F30);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFB9B9B9);
  static const Color darkgray = Color(0xFF686868);
  static const Color black = Color(0xFF1C1C1C);
  static const Color offwhite = Color(0xFFF0F0F0);
  static const Color red = Color(0xFFFF3232);
  static const Color lightgray = Color(0xFFE9EAEB);
  static const Color green = Color(0xFF00C853);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
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
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
       headlineMedium: TextStyle(
        color: primaryLight,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offwhite),
      ),
        focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
       borderSide: BorderSide(color: offwhite),
      ),
         errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
       borderSide: BorderSide(color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16),
       borderSide: BorderSide(color: red),
      ),
      
      hintStyle: TextStyle(
        color: darkgray,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
       
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ), 
      tileColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: offwhite)
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLight,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    
        backgroundColor: primaryLight,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
