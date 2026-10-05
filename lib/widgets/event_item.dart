import 'package:evently/app_theme.dart';
import 'package:evently/models/Event_Model.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);
    bool isFavorite = user.ischecked(event.id);
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/${event.category.ImageName}.png',
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
            DateFormat('dd MMM').format(event.date),
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
                    event.title,
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
                  onTap: () {
                    if (isFavorite) {
                      user.removeEventFromFavorites(event.id);
                      Provider.of<eventsProvider>(
                        context,
                        listen: false,
                      ).filterFavoriteEvents(
                        user.currentUser!.favoriteeventID,
                      );
                    } else {
                      user.addtoEventFavorites(event.id);
                    }
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
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
