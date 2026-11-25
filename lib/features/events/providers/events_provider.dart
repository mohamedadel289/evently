import 'package:evently/features/events/models/event_model.dart';
import 'package:evently/features/events/models/categories_model.dart';
import 'package:evently/core/data/firebase_services.dart';
import 'package:flutter/material.dart';


class eventsProvider with ChangeNotifier {
List<EventModel> events = [];
List<EventModel>  displayEvents = [];


Future<void> getEvents() async {
    events = await firebase_services.getevent();
    displayEvents = events;
    notifyListeners();
  }

  void filterEvents(CategoriesModel? category) {
    if (category == null ) {
      displayEvents = events;
    } else {
      displayEvents = events.where((event)=> event.category == category).toList();
          
    }
    notifyListeners();
  }
 
}