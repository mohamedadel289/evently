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
  late eventsProvider eventProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> favoriteEvents =
        Provider.of<UserProvider>(
          context,
          listen: false,
        ).currentUser!.favoriteeventID ;
    eventProvider.filterFavoriteEvents(favoriteEvents);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<eventsProvider>(context);
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

               itemCount: eventProvider.FavoriteEvents.length,
              itemBuilder: (context, index) => EventItem(event:eventProvider.FavoriteEvents[index]),
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
