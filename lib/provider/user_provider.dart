import 'package:evently/models/user_model.dart';
import 'package:evently/widgets/firebase_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void setCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }
  bool ischecked(String eventId) {
    return currentUser?.favoriteeventID.contains(eventId) ?? false;
  }

  void addtoEventFavorites(String eventId){
    firebase_services.addtoEventFavorites(eventId);
    currentUser?.favoriteeventID.add(eventId);
    notifyListeners();
    }
    void removeEventFromFavorites(String eventId){
    firebase_services.removeEventFromFavorites(eventId);
    currentUser?.favoriteeventID.remove(eventId);
    notifyListeners();
    }
  }
