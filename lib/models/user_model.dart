class UserModel {
  String id;
  String name;
  String email;
  List<String> favoriteeventID;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favoriteeventID,
  });
  UserModel.FormJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        favoriteeventID:json['favoriteeventID'] ?? [],
      );
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'favoriteeventID': favoriteeventID,
  };
}
