import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme kLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 131, 57, 0),
  brightness: Brightness.dark,
);

final lightTheme = ThemeData().copyWith(
  colorScheme: kLightColorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyMedium: const TextStyle(color: Colors.white, fontSize: 15),
      bodySmall: const TextStyle(color: Colors.white, fontSize: 13)),
  scaffoldBackgroundColor: kLightColorScheme.surface,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kLightColorScheme.surface,
    selectedItemColor: kLightColorScheme.onPrimary,
    unselectedItemColor: kLightColorScheme.onSurface,
    selectedIconTheme: IconThemeData(color: kLightColorScheme.onPrimary),
    unselectedIconTheme: IconThemeData(color: kLightColorScheme.onSurface),
  ),
);
