import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:evently/widgets/ui_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key:formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 28,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 48),
                  Text(
                    l10n.createAccountTitle,
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  DefaultTextFormField(
                    hintText: l10n.enterName,
                    prefixIcon: 'user',
                    controller: nameController,
                    validator:(value){
                      if(value ==null ||value.length<3){
                        return l10n.invalidName;
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: l10n.enterEmail,
                    prefixIcon: 'email',
                    controller: emailController,
                    validator:(value){
                      if(value ==null ||!value.contains('@')){
                        return l10n.invalidEmail;
                      }
                       final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return l10n.invalidEmailAddress;
                  }
                      return null;
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: l10n.enterPassword,
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: passwordController,
                    validator:(value){
                      if(value ==null ||value.length<8){
                        return l10n.invalidPassword;
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: l10n.confirmYourPassword,
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: confirmPasswordController,
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return l10n.pleaseConfirmPassword;
                      }
                      if(value != passwordController.text){
                        return l10n.passwordsDoNotMatch;
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 8),
              
                  SizedBox(height: 48),
                  ElvatedButton(text: l10n.register, onPressed: register),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.dontHaveAccount,
                        style: theme.textTheme.titleSmall,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ), //tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(l10n.login),
                        onPressed: () {
                          //Navigator.of(context).push(
                          //MaterialPageRoute(
                          //builder: (context) => RegisterScreen(),
                          //),
                          //);
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    l10n.or,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      fixedSize: Size(343, 48),
                      backgroundColor: AppTheme.white,
                      foregroundColor: AppTheme.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: AppTheme.offwhite),
                      ),
                    ),
                    onPressed: registerWithGoogle,
                    label: Text(
                      l10n.signUpWithGoogle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppTheme.primaryLight,
                      ),
                    ),
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void register() async {
    if (!formkey.currentState!.validate()) return;

    firebase_services
        .register(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
        )
        .then((user) {
          Provider.of<UserProvider>(context, listen: false).setCurrentUser(user);
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        })
        .catchError((error) {
          String? errorMessage;
          if (error is FirebaseAuthException) {
            errorMessage = error.message;
          }
          UiUtils.showErrorMessage(errorMessage ?? AppLocalizations.of(context)!.registrationFailed);
        });
  }
  void registerWithGoogle() async {
    try {
      final user = await firebase_services.signupwithGoogle();
          if (user == null || !mounted) return;
      Provider.of<UserProvider>(context, listen: false).setCurrentUser(user);
      await Provider.of<eventsProvider>(context, listen: false).getEvents();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      String? errorMessage;
      if (error is FirebaseAuthException) {
        errorMessage = error.message;
      }
      UiUtils.showErrorMessage(errorMessage ?? AppLocalizations.of(context)!.googleSignInFailed);
    }}}