import 'package:evently/app_theme.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
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
                  'Login to your account',
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 24),
                DefaultTextFormField(
                  hintText: 'Enter your email',
                  prefixIcon: 'email',
                  controller: emailController,
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Enter your password',
                  prefixIcon: 'lock',
                  ispassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(alignment: Alignment.centerRight),
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppTheme.primaryLight,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.primaryLight,
                    ),
                  ),
                ),
                SizedBox(height: 48),
                ElvatedButton(text: 'Login', onPressed: () {}),
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: theme.textTheme.titleSmall,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text('Signup'),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Or',
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
                  onPressed: () {},
                  label: Text(
                    'Login with Google',
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
    );
  }
}
