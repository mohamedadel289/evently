import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/screens/forget_password.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:evently/widgets/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                    validator:(value){
                      if(value==null||value.length<3){
                        return 'invalid email';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: 'Enter your password',
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: passwordController,
                    validator:(value){
                      if(value==null||value.length<8){
                        return 'invalid password';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(alignment: Alignment.centerRight),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ));
                    },
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
                  ElvatedButton(text: 'Login', onPressed: login),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: theme.textTheme.titleSmall,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero,minimumSize: Size.zero,), //tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text('Register'),
                        onPressed: () {
                          //Navigator.of(context).push( 
                            //MaterialPageRoute(
                              //builder: (context) => RegisterScreen(),
                            //),
                          //);
                          Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                        },
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
      ),
    );
  }
  void login() async {
    if (!formkey.currentState!.validate()) return;
    firebase_services.login(
      email: emailController.text,
      password: passwordController.text,
    ).then((user) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }).catchError((error) {
      String? errorMessage;
      if(error is FirebaseAuthException){
        errorMessage = error.message;
      } else {
        UiUtils.showErrorMessage( errorMessage);
      }
    });

   
    
  }
}
