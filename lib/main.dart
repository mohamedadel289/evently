import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/config/firebase_options.dart';
import 'package:evently/features/home/presentation/home_screen.dart';
import 'package:evently/features/events/providers/events_provider.dart';
import 'package:evently/features/auth/providers/user_provider.dart';
import 'package:evently/features/events/presentation/create_event_screen.dart';
import 'package:evently/features/auth/presentation/login_screen.dart';
import 'package:evently/features/auth/presentation/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => eventsProvider()),
    ],
    child: evently()));
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
     initialRoute: LoginScreen.routeName,
    );
  }
}
