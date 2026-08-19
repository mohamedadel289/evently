import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class ElvatedButton extends StatelessWidget {
 String text;
 VoidCallback onPressed;
  ElvatedButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(343, 48),
        backgroundColor: AppTheme.primaryLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(text,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
    );
  }
}