import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  /// Indicates if the user is currently logged in
  bool loggedIn = false;

  /// User data

  String uid = "";
  String userName = "";
  String email = "";

  /// Loads data from Firebase
  Future<void> loadData() async {
    notifyListeners();
  }
}
