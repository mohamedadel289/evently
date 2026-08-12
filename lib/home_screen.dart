import 'package:evently/app_theme.dart';
import 'package:evently/tabs/favorite/favorite_tab.dart';
import 'package:evently/tabs/home/home_tab.dart';
import 'package:evently/tabs/profile/profile_tab.dart';
import 'package:evently/widgets/nav_bar_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const Center(child: HomeTab()),
    const Center(child: FavoriteTab()),
    const Center(child: ProfileTab()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: NavBarIcons(iconPath: 'home_unactive'),
            activeIcon: NavBarIcons(iconPath: 'home_active'),
          
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: NavBarIcons(iconPath: 'Favorite_unactive'),
            activeIcon: NavBarIcons(iconPath: 'Favorite_active'),
          ),
          BottomNavigationBarItem(
            icon: NavBarIcons(iconPath: 'profile_unactive'),
            label: 'Profile',
            activeIcon: NavBarIcons(iconPath: 'profile_active'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryLight,
        onPressed: () {},
        child: const Icon(Icons.add, color: AppTheme.white, size: 30),
        shape: CircleBorder(),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop
      
    );
  }
}