import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isDark = false;

  AdaptiveThemeMode currentTheme = AdaptiveThemeMode.dark;

  setCurrentTheme() async {
    currentTheme = await AdaptiveTheme.getThemeMode() ?? AdaptiveThemeMode.dark;
    isDark = currentTheme == AdaptiveThemeMode.dark;
  }

  changeTheme(AdaptiveThemeMode theme) {
    isDark = !isDark;
    currentTheme = theme;
    notifyListeners();
  }
}
