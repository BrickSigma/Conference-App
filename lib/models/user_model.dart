import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  /// User data

  User? userInfo;
  String userName = "";
  String email = "";

  /// Initialize the user model data for the first time.
  void init(User userInfo, String userName, String email) {
    this.userInfo = userInfo;
    this.userName = userName;
    this.email = this.email;
    notifyListeners();
  }

  /// Loads user data from database.
  Future<void> loadUserData() async {
    // TODO: Implement functionality
  }
}
