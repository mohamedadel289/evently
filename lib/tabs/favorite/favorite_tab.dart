import 'package:evently/widgets/defualt_text_form_filed.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          DefaultTextFormField(hintText: 'Search for event', sufixIcon: 'search',),
          SizedBox(height: 16),
        Expanded(
              child: ListView.separated(
                
                itemCount: 10, 
                itemBuilder: (context, index) => EventItem(),
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