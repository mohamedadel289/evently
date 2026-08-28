import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  IconData icon;
  String title;
  bool isSelected;
  TabItems({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? primaryColor : AppTheme.white,
        border: Border.all(color: AppTheme.offwhite),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.white : primaryColor,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
