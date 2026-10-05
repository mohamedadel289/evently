import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = context.watch<eventsProvider>();
    final user = context.watch<UserProvider>().currentUser;
    final favoriteEventIds = user?.favoriteeventID ?? <String>[];
    final favoriteEvents = eventProvider.events
        .where((event) => favoriteEventIds.contains(event.id))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Search for event',
            sufixIcon: 'search',
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: favoriteEvents.length,
              itemBuilder: (context, index) =>
                  EventItem(event: favoriteEvents[index]),
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
            ),
          ),
        ],
      ),
    );
  }
}
