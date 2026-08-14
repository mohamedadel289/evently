import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatelessWidget {
TextEditingController? controller;
String hintText;
String? sufixIcon;
String? prefixIcon;
void Function(String)? onchanged;
DefaultTextFormField({
  this.controller,
  required this.hintText,
  this.sufixIcon,
  this.prefixIcon,
  this.onchanged,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon == null ? null:Padding(
         padding: const EdgeInsets.only(right: 16.0,top: 12.0,bottom: 12.0),
          child: SvgPicture.asset('assets/icons/$prefixIcon.svg',width: 24,height: 24,),
        ),
        suffixIcon: sufixIcon == null ? null:Padding(
          padding: const EdgeInsets.only(right: 16.0,top: 12.0,bottom: 12.0),
          child: SvgPicture.asset('assets/icons/$sufixIcon.svg',width: 24,height: 24,),
        ),
      ),


    );
  }
}