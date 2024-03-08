import 'package:flutter/material.dart';
import 'package:gs3_test/features/bottom_navigation/bottom_navigation_view.dart';
import 'package:gs3_test/support/theme/app_theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const BottomNavigationView(),
    ),
  );
}
