import 'dart:convert';

class UserModel {
  final String name;
  final String photoURL;

  UserModel({required this.name, required this.photoURL});

  factory UserModel.fromMap(Map map) =>
      UserModel(name: map['name'], photoURL: map['photoURL']);

  factory UserModel.fromJSON(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, String> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  String toJSON() => jsonEncode(toMap());
}
