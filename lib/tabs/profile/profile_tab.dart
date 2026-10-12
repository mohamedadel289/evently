import 'package:evently/app_theme.dart';
import 'package:evently/models/Language_model.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).currentUser;
    final textTheme = Theme.of(context).textTheme;
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.18,
            backgroundImage: AssetImage('assets/images/logo_profile.png'),
          ),
          SizedBox(height: 16),
          Text(user?.name ?? 'Guest', style: textTheme.titleLarge),
          SizedBox(height: 4),
          Text(user?.email ?? 'guest@example.com', style: textTheme.titleSmall),
          SizedBox(height: 32),
          SwitchListTile(
            title: Text(l10n.darkMode, style: textTheme.titleMedium),
            value: settingProvider
                .isDarkMode, // You can replace this with the actual value from your SettingProvider
            onChanged: (isDarkMode) {
              settingProvider.changeTheme(
                isDarkMode ? ThemeMode.dark : ThemeMode.light,
              );
            },
            thumbColor: WidgetStatePropertyAll(AppTheme.white),
            trackColor: WidgetStatePropertyAll(
              settingProvider.isDarkMode
                  ? AppTheme.primaryDark
                  : AppTheme.lightgray,
            ),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text(l10n.language),
            trailing: DropdownButton(
              borderRadius: BorderRadius.circular(16),
              dropdownColor: settingProvider.isDarkMode ? AppTheme.navy : AppTheme.lightgray,
              underline: SizedBox(),
              value: settingProvider.languagecode,
              items: LanguageModel.Language.map(
                (Language) => DropdownMenuItem(
                  value: Language.code,
                  child: Text(Language.name),
                ),
              ).toList(),
              onChanged: (Languagecode) {
                if (Languagecode == null) return;
                settingProvider.changeLanguage(Languagecode);
              },
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text(l10n.logout),
            trailing: SvgPicture.asset(
              'assets/icons/logout-02.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            onTap: () {
              firebase_services.logout().then((_) {
                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginScreen.routeName);
                Provider.of<UserProvider>(
                  context,
                  listen: false,
                ).setCurrentUser(null);
              });
            },
          ),
        ],
      ),
    );
  }
}
