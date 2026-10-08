import 'package:evently/models/categories_model.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/setting_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/tabs/home/tab_items.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).currentUser;
    final theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.welcomeBack, style: theme.titleMedium),
        SizedBox(height: 4),
        Text(user?.name ?? l10n.guest, style: theme.titleLarge),
        DefaultTabController(
          length: CategoriesModel.Categories.length + 1,
          child: TabBar(
            onTap: (index) {
              if (currentIndex == index) return;
              setState(() {
                currentIndex = index;
                Provider.of<eventsProvider>(
                  context,
                  listen: false,
                ).filterEvents(
                  currentIndex == 0
                      ? null
                      : CategoriesModel.Categories[index - 1],
                );
              });
            },
            isScrollable: true,
            padding: EdgeInsets.symmetric(vertical: 24),
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.only(right: 8),
            tabAlignment: .start,
            tabs: [
              TabItems(
                title: l10n.all,
                icon: Icons.category_outlined,
                isSelected: currentIndex == 0,
              ),
              ...CategoriesModel.Categories.map(
                (Category) => TabItems(
                  title: Category.label,
                  icon: Category.icon,
                  isSelected:
                      currentIndex - 1 ==
                      CategoriesModel.Categories.indexOf(Category),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
