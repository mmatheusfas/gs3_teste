import 'package:flutter/material.dart';

final class AppTheme {
  static final appTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Colors.indigo),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting,
      elevation: 2,
    ),
  );
}
