import 'package:flutter/material.dart';

class AppTheme {
  //theme light
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(
      255,
      255,
      218,
      218,
    ), //warna background light
    fontFamily: 'CascadiaMono',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.blueGrey, //warna kursor
      selectionColor: Colors.blueGrey,
      selectionHandleColor: Colors.blueGrey,
    ),
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
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.blueGrey, //warna saat fokus
          width: 1.0,
        ),
      ), //box input
      floatingLabelStyle: const TextStyle(
        color: Colors.blueGrey, //warna label saat naik ke atas
      ),
      filled: true,
      fillColor: const Color.fromARGB(
        255,
        252,
        230,
        230,
      ), //warana box input tugas dan search
    ),
    cardTheme: CardTheme(
      color: const Color.fromARGB(255, 252, 230, 230), //warna box list tu
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ), //warna latar belakang
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(
        const Color.fromARGB(255, 244, 159, 159), //warna checklist
      ),
    ), //Checklist berwarna merah muda
  );

  //theme Dark
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'RobotoSlab',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E1E),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Colors.deepPurpleAccent),
    ),
  );
}
