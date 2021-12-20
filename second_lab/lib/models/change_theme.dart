import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool("ThemeBool", value));
    notifyListeners();
  }

  ThemeProvider() {
    _getDarkTheme();
  }

  void _getDarkTheme() {
    SharedPreferences.getInstance().then((prefs) {
      _darkTheme = prefs.getBool("OurNewTheme") ?? false;
    });
  }
}
