import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: Text('Forget Password',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.white),),
      ),
      body: Center(
        child: Text('Forget Password Screen'),
      ),
    );
  }
}