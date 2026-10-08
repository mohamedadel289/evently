import 'package:evently/app_theme.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/final_onbording_screen.dart';
import 'package:evently/screens/forget_password.dart';
import 'package:evently/screens/intro_onbording.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/register_screen.dart';
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
      ChangeNotifierProvider(create: (_) => SettingProvider()),
    ],
    child: evently()));
}
class evently extends StatelessWidget {
  const evently({super.key});
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: setting.theme, // Use the system theme mode
     routes: {
     HomeScreen.routeName:(_) => HomeScreen(),
     CreateEventScreen.routeName:(_) =>  CreateEventScreen(),
      LoginScreen.routeName:(_)=> LoginScreen(),
     RegisterScreen.routeName:(_)=> RegisterScreen(),
     ForgetPasswordScreen.routeName:(_)=> ForgetPasswordScreen(),
      IntroOnbording.routeName:(_)=> IntroOnbording(),
      FinalOnbordingScreen.routeName:(_)=> FinalOnbordingScreen(),
     },
     initialRoute: IntroOnbording.routeName,
    localizationsDelegates:AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(setting.languagecode),
    );
  }
}
