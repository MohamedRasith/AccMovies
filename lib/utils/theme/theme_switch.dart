import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:acc_movies/controller/theme_controller.dart';
import 'package:provider/provider.dart';

Widget themeSwitch() {
  return Consumer<ThemeController>(builder: (context, controller, _) {
    return Transform.scale(
      scale: 1.3,
      child: Switch(
        activeColor: Colors.greenAccent,
        inactiveThumbColor: Colors.white,
        value: controller.isDark,
        activeThumbImage: const AssetImage("assets/moon.png"),
        inactiveThumbImage: const AssetImage("assets/sun.png"),
        onChanged: (bool value) {
          if (value) {
            AdaptiveTheme.of(context).setDark();
            controller.changeTheme(AdaptiveThemeMode.dark);
          } else {
            AdaptiveTheme.of(context).setLight();
            controller.changeTheme(AdaptiveThemeMode.light);
          }
        },
      ),
    );
  });
}