import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  /// Indicates if the user is currently logged in
  bool loggedIn = false;

  String uid = "";
  String userName = "";
  String email = "";

  /// Loads data from Firebase
  Future<void> loadData() async {}
}
