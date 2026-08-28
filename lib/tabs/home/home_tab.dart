import 'package:evently/tabs/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: 10, // Replace with actual event count
              itemBuilder: (context, index) {
                return EventItem();
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
