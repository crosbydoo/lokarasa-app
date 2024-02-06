import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/themes/color_schemes.g.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  navigationBarTheme: const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
  ),
  colorScheme: darkColorScheme,
);
