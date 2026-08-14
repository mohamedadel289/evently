import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/birthday.png',
            width: double.infinity,
            height: size.height * 0.23,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 8, top: 8),
          decoration: BoxDecoration(
            color: AppTheme.backgroundLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.offwhite),
          ),
          child: Text(
            "21 Jan",
            style: textTheme.titleMedium?.copyWith(color: primaryColor),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 8, top: 8),
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.offwhite),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'This is a Birthday Party Event This is a Birthday Party Event This is a Birthday Party Event',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall?.copyWith(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_outline,
                    color: primaryColor,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
