import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool lightTheme = true; // Default to light color theme.

  void flipColorTheme() async {
    lightTheme = !lightTheme;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("lightTheme", lightTheme);
    notifyListeners();
  }

  /// Get the selected color theme.
  Future<void> getColorTheme() async {
    final prefs = await SharedPreferences.getInstance();
    lightTheme = prefs.getBool("lightTheme") ?? true;
    notifyListeners();
  }
}
