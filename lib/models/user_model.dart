import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  /// User data

  User? userInfo;
  String userName = "";
  String bio = "";
  List<Map<String, String>> links = [];
  List<Map<String, String>> contacts = [];

  /// Creates a new document entry for the user.
  static Future<void> createUserDocument(String uid, String userName) async {
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      "username": userName,
      "bio": "",
      "links": [],
      "contacts": [],
    };

    await db.collection("users").doc(uid).set(data);
  }

  /// Retrieves the user data from firebase.
  ///
  /// `currentUser` - FirebaseAuth User instance
  Future<void> loadUserData(User currentUser) async {
    final db = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> document =
        await db.collection("users").doc(currentUser.uid).get();

    if (!document.exists) {
      return;
    }

    Map<String, dynamic> data = document.data()!;

    userInfo = currentUser;
    userName = data["username"] ?? currentUser.email ?? "";
    bio = data["bio"] ?? "";
    links = List<Map<String, String>>.from(data["links"] ?? []);
    contacts = List<Map<String, String>>.from(data["contacts"] ?? []);
  }

  /// Copy user data from one object to this one.
  void copyFrom(UserModel user) {
    userInfo = user.userInfo;
    userName = user.userName;
    bio = user.bio;
    links = user.links;
    contacts = user.contacts;
  }
}
