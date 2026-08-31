import 'package:evently/models/Event_Model.dart';
import 'package:evently/models/categories_model.dart';
import 'package:evently/widgets/firebase_services.dart';
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