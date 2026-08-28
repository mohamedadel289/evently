import 'package:evently/app_theme.dart';
import 'package:evently/models/Language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.18,
            backgroundImage: AssetImage('assets/images/logo_profile.png'),
          ),
          SizedBox(height: 16),
          Text('Mohamed Adel', style: textTheme.titleLarge),
          SizedBox(height: 4),
          Text('adel@example.com', style: textTheme.titleSmall),
          SizedBox(height: 32),
          SwitchListTile(
            title: Text('Dark Mode', style: textTheme.titleMedium),
            value: false,
            onChanged: (value) {},
            thumbColor: WidgetStatePropertyAll(AppTheme.white),
            trackColor: WidgetStatePropertyAll(AppTheme.lightgray),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton(
            borderRadius: BorderRadius.circular(16),
              dropdownColor: AppTheme.white,
              underline: SizedBox(),
              value: 'en',
              items: LanguageModel.Language.map(
                (Language) => DropdownMenuItem(
                  value: Language.code,
                  child: Text(Language.name),
                ),
              ).toList(),
              onChanged: (Languagecode) {
                print(Languagecode);
              },
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Logout'),
            trailing: SvgPicture.asset(
              'assets/icons/logout-02.svg',
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
