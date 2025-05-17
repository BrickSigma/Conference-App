/// Used to indicate the authenication/login state of the user and application
library;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loggedIn = false;

  /// Get the current authentication state of the app.
  User? getAuthState() {
    User? user = FirebaseAuth.instance.currentUser;
    loggedIn = user != null;
    notifyListeners();
    return user;
  }

  /// Logs in a user.
  Future<void> login() async {
    loggedIn = true;
    notifyListeners();
  }

  /// Logs out a user.
  Future<void> logout() async {
    loggedIn = false;
    notifyListeners();
  }
}
