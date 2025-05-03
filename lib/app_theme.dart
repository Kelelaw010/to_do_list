import 'dart:math';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: const Color.fromARGB(
      255,
      255,
      218,
      218,
    ), //warna background
    fontFamily: 'Robeto',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(
          255,
          244,
          159,
          159,
        ), //warna button "tambah"
        foregroundColor: const Color.fromARGB(
          255,
          253,
          253,
          253,
        ), //warna "tambah"
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: const Color.fromARGB(255, 252, 230, 230),
    ),
    cardTheme: CardTheme(
      color: const Color.fromARGB(255, 252, 230, 230),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(
        const Color.fromARGB(255, 244, 159, 159), //warna checklist
      ),
    ),
  );
}
