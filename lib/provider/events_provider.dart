import 'package:evently/models/Event_Model.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:flutter/material.dart';

class eventsProvider with ChangeNotifier {
List<EventModel> events = [];
Future<void> getEvents() async {
    events = await firebase_services.getevent();
    notifyListeners();
  }
}