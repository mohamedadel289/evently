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
     
     routes: {
      HomeScreen.routeName:(_) => HomeScreen(),
     },
    );
  }
}
