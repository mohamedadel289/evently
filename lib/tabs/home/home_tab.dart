import 'package:evently/provider/events_provider.dart';
import 'package:evently/tabs/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
     eventsProvider EventsProvider = Provider.of<eventsProvider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: EventsProvider.events.length, // Replace with actual event count
              itemBuilder: (context, index) {
                return EventItem(event: EventsProvider.events[index]);
              },
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
