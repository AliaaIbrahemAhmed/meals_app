import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/taps_screen.dart';
import 'package:meals_app/themes/light_theme.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: const HomeScreen(),
      theme: lightTheme,
    ),
  ));
}
