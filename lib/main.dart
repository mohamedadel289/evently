import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      RegisterScreen.routeName:(_)=> RegisterScreen(),
     // ForgetPasswordScreen.routeName:(_)=> ForgetPasswordScreen(),
     },
     initialRoute: CreateEventScreen.routeName,
    );
  }
}
