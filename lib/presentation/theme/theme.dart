import 'package:flutter/material.dart';


  // Light Theme configuration here ==>
  final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFEAECF0),
      elevation: 0.0,
      surfaceTintColor: Colors.white,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      surface: Color(0xFFEAECF0),
      onSurface: Colors.black,
      surfaceTint: Colors.white,
      primary: Colors.black,
      onPrimary: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size.fromHeight(40)),
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))))),
  );

  // Dark Theme configuration ==>
  final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1D2939),
      elevation: 0.0,
      surfaceTintColor: Colors.black,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      surface: Color(0xFF101828),
      onSurface: Colors.white,
      surfaceTint: Colors.black12,
      primary: Colors.white,
      onPrimary: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(const Size.fromHeight(40)),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(Colors.black),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))))),
  );

