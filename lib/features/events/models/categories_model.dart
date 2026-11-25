import 'package:flutter/material.dart';

class CategoriesModel {
  String id;
  String label;
  IconData icon;
  String ImageName;
  CategoriesModel({required this.id, required this.label, required this.icon, required this.ImageName});
  static List<CategoriesModel> Categories=
    [
      CategoriesModel(id: 'sport', label: 'Sport', icon: Icons.sports_basketball_outlined, ImageName: 'sport'),
      CategoriesModel(id: 'birthday', label: 'Birthday', icon: Icons.cake_outlined, ImageName: 'birthday'),
      CategoriesModel(id: 'meeting', label: 'Meeting', icon: Icons.event_outlined, ImageName: 'meeting'),
    ];
  }
  
