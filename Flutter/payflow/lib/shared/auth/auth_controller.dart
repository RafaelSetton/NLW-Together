import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController {
  UserModel? _user;
  static final AuthController _instance = AuthController._privateFactory();
  UserModel? get user => _user;

  AuthController._privateFactory();
  factory AuthController() => _instance;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", user.toJSON());
  }

  Future<void> loadUser(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user")) {
      final user = prefs.getString("user")!;
      setUser(context, UserModel.fromJSON(user));
    } else {
      setUser(context, null);
    }
  }
}
