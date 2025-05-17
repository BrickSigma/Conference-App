/// Used to indicate the authenication/login state of the user and application
library;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  /// Get the current authentication state of the app.
  User? getAuthState() {
    User? user = FirebaseAuth.instance.currentUser;
    _loggedIn = user != null;
    notifyListeners();
    return user;
  }

  /// Logs in a user.
  Future<void> login() async {
    _loggedIn = true;
    notifyListeners();
  }

  /// Logs out a user.
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    _loggedIn = false;
    notifyListeners();
  }
}
