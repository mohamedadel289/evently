import 'package:evently/app_theme.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DefaultTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String hintText;
  String? sufixIcon;
  String? prefixIcon;
  bool ispassword;
  int maxLines;
  String? Function(String?)? validator;
  
  void Function(String)? onchanged;
  DefaultTextFormField({super.key, 
    this.controller,
    required this.hintText,
    this.sufixIcon,
    this.prefixIcon,
    this.ispassword = false,
    this.onchanged,
    this.validator,
    this.maxLines = 1,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
 late bool isobscureText = widget.ispassword;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<SettingProvider>(context).isDarkMode;
    return TextFormField(
      onChanged: widget.onchanged,
      controller: widget.controller,
      obscureText: isobscureText,
      maxLines: widget.maxLines,
      validator: widget.validator,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_)=> FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIcon}.svg',
                  width: 24,
                  height: 24,
                ),
              ),
        suffixIcon: widget.ispassword
            ? IconButton(
                icon: Icon(
                  isobscureText
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  isobscureText = !isobscureText;
                  setState(() {});
                },
              )
            : widget.sufixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 12.0),
                child: SvgPicture.asset(
                  'assets/icons/${widget.sufixIcon}.svg',
                  width: 24,
                  height: 24,
                ),
              ),
      ),
      style: isDarkMode ? Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.offwhite) : Theme.of(context).textTheme.titleLarge,
    );
  }
}
