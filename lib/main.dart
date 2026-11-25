import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/home/presentation/home_screen.dart';
import 'package:evently/features/events/presentation/create_event_screen.dart';
import 'package:evently/features/auth/presentation/login_screen.dart';
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
      CreateEventScreen.routeName:(_) =>  CreateEventScreen(),
      LoginScreen.routeName:(_)=> LoginScreen(),
     },
     initialRoute: LoginScreen.routeName,
    );
  }
}
