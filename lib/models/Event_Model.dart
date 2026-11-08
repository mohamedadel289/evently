import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/categories_model.dart';

class EventModel {
  String id;
  String ownerId;
  CategoriesModel category;
  final String title;
  final String description;
  final DateTime date;

  EventModel({
    this.id = '',
    this.ownerId = '',
    required this.title,
    required this.description,
    required this.date,
    required this.category,
  });
  EventModel.FormJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        ownerId: json['ownerId'] ?? '',
        title: json['title'],
        description: json['description'],
        date: (json['date'] as Timestamp).toDate(),
        category: CategoriesModel.Categories.firstWhere(
          (category) => category.id == json['categoryId'],
        ),
      );
  Map<String, dynamic> toJson() => {
    'id': id,
    'ownerId': ownerId,
    'title': title,
    'description': description,
    'categoryId': category.id,
    'date': Timestamp.fromDate(date),
  };
}
