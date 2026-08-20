import 'package:evently/app_theme.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
                    'Create an account',
                    style: theme.textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  DefaultTextFormField(
                    hintText: 'Enter your name',
                    prefixIcon: 'user',
                    controller: nameController,
                    validator:(value){
                      if(value ==null ||value.length<3){
                        return 'Invalid name';
                      }
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: 'Enter your email',
                    prefixIcon: 'email',
                    controller: emailController,
                    validator:(value){
                      if(value ==null ||!value.contains('@')){
                        return 'Invalid email';
                      }
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: 'Enter your password',
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: passwordController,
                    validator:(value){
                      if(value ==null ||value.length<8){
                        return 'Invalid password';
                      }
                    }
                  ),
                  SizedBox(height: 16),
                  DefaultTextFormField(
                    hintText: 'Confirm your password',
                    prefixIcon: 'lock',
                    ispassword: true,
                    controller: passwordController,
                    validator:(value){
                      if(value != passwordController.text){
                        return 'Passwords do not match';
                      }
                    }
                  ),
                  SizedBox(height: 8),
              
                  SizedBox(height: 48),
                  ElvatedButton(text: 'Register', onPressed: () {}),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: theme.textTheme.titleSmall,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ), //tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text('Login'),
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
                      minimumSize: Size.zero,
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
                      'Sign Up with Google',
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
  void register(){
    if(formkey.currentState!.validate()){
    // Perform registration logic here
  }
  }
}
