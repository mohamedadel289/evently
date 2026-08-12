import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const evently());
}
class evently extends StatelessWidget {
  const evently({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
     routes: {
      HomeScreen.routeName:(_) => HomeScreen(),
     },
     initialRoute: HomeScreen.routeName,
    );
  }
}
