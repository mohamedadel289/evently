import 'package:evently/app_theme.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/screens/final_onbording_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/elvated_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroOnbording extends StatelessWidget {
  static const String routeName = '/IntroOnbording';

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Image.asset(
                'assets/images/logo.png',
                height: 28,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height: 24),
              Image.asset(
                'assets/images/being-creative.png',
                height: 343,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24),
              Text(
                l10n.personalizeExperience,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              Text(
                l10n.chooseThemeLanguage,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.grey,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.language,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  ChoiceChip(
                    label: Text(l10n.english),
                    selected: settingProvider.languagecode == 'en',
                    onSelected: (value) {
                      settingProvider.changeLanguage('en');
                    },
                    selectedColor: AppTheme.primaryLight,
                    labelStyle: TextStyle(
                      color: settingProvider.languagecode == 'en'
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                     showCheckmark: false,
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Text(l10n.arabic),
                    selected: settingProvider.languagecode == 'ar',
                    onSelected: (value) {
                      settingProvider.changeLanguage('ar');
                    },
                    selectedColor: AppTheme.primaryLight,
                    labelStyle: TextStyle(
                      color: settingProvider.languagecode == 'ar'
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                    showCheckmark: false,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.theme,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  ChoiceChip(
                    label: Icon(  
                      Icons.light_mode,
                      color: !settingProvider.isDarkMode
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                    selected: !settingProvider.isDarkMode,
                    onSelected: (value) {
                      settingProvider.changeTheme(ThemeMode.light);
                    },
                    selectedColor: AppTheme.primaryLight,
                    labelStyle: TextStyle(
                      color: !settingProvider.isDarkMode
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                     showCheckmark: false,
                  ),
                  SizedBox(width: 8),
                  ChoiceChip(
                    label: Icon(
                      Icons.dark_mode,
                      color: settingProvider.isDarkMode
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                    selected: settingProvider.isDarkMode,
                    onSelected: (value) {
                      settingProvider.changeTheme(ThemeMode.dark);
                    },
                    selectedColor: AppTheme.primaryLight,
                    labelStyle: TextStyle(
                      color: settingProvider.isDarkMode
                          ? AppTheme.white
                          : AppTheme.primaryLight,
                    ),
                     showCheckmark: false,
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElvatedButton(
                text: l10n.letsStart,
                onPressed: () {
                  Navigator.of(context).pushNamed(FinalOnbordingScreen.routeName);
                },
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
