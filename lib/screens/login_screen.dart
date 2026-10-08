import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/screens/forget_password.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:evently/widgets/ui_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 28,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 40),
                  Text(
                    l10n.loginToAccount,
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  DefaultTextFormField(
                    hintText: l10n.enterEmail,
                    prefixIcon: 'email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.length < 3) {
                        return l10n.invalidEmail;
                      }
                       final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Invalid email address';
                  }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: l10n.enterPassword,
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return l10n.invalidPassword;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ForgetPasswordScreen.routeName,
                      );
                    },
                    child: Text(
                      l10n.forgotPassword,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppTheme.primaryLight,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.primaryLight,
                      ),
                    ),
                  ),
                  SizedBox(height: 48),
                  ElvatedButton(text: AppLocalizations.of(context)!.login, onPressed: login),
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
                        child: Text(AppLocalizations.of(context)!.register,
                      ),
                        onPressed: () {
                          //Navigator.of(context).push(
                          //MaterialPageRoute(
                          //builder: (context) => RegisterScreen(),
                          //),
                          //);
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(RegisterScreen.routeName);
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
                      fixedSize: Size(343, 48),
                      backgroundColor: AppTheme.white,
                      foregroundColor: AppTheme.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: AppTheme.offwhite),
                      ),
                    ),
                    onPressed: () {
                      googlelogin();
                    },
                    label: Text(
                      l10n.loginWithGoogle,
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

  Future<void> login() async {
    if (!formkey.currentState!.validate()) return;

    try {
      final user = await firebase_services.login(
        email: emailController.text,
        password: passwordController.text,
      );

      if (!mounted) return;
      Provider.of<UserProvider>(context, listen: false).setCurrentUser(user);
      await Provider.of<eventsProvider>(context, listen: false).getEvents();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;
      UiUtils.showErrorMessage(
        error.message ?? AppLocalizations.of(context)!.loginFailed,
      );
    } catch (error) {
      if (!mounted) return;
      UiUtils.showErrorMessage(error.toString());
    }
  }

  void googlelogin() async {
    try {
      final user = await firebase_services.loginwithGoogle();
      if (user == null || !mounted) return;
      Provider.of<UserProvider>(context, listen: false).setCurrentUser(user);
      await Provider.of<eventsProvider>(context, listen: false).getEvents();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      if (!mounted) return;
      final errorMessage = error is FirebaseAuthException
          ? error.message
          : error.toString().replaceFirst('Exception: ', '');
      UiUtils.showErrorMessage(errorMessage ?? AppLocalizations.of(context)!.googleSignInFailed);
    }
  }
}
