import 'package:evently/app_theme.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/ForgetPasswordScreen';
  
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settingProvider.isDarkMode ? AppTheme.navy : AppTheme.lightgray,
        title: Text(l10n.forgetPassword,style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 18,
          color: settingProvider.isDarkMode ? AppTheme.white : AppTheme.black),),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children:[
                Image.asset(
                  'assets/images/change_setting.png',
                 
                
                ),
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
                        return l10n.invalidEmailAddress;
                      }
                    
                    return null;
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 380,
                  child: ElvatedButton(
                    text: l10n.resetPassword,
                    onPressed: resetpassword,
                      
                    
                  ),
                )
              ]
            
            ),
          ),
        ),
      ),
    );
  }
  void resetpassword() async{
    if(formkey.currentState!.validate()){
      try{
        await firebase_services.restpassword(emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.passwordResetSent)),
        );
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorPrefix(e))),
        );
      }
    }
  }
}