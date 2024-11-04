import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

// Define a custom theme class
class AppTheme {
  static ThemeData get theme {
    const primaryColor = Color(0xFF0065c1);
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(), // Use a nice English font
      inputDecorationTheme: const InputDecorationTheme(
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: primaryColor), // Main color for outline
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor), // Main color for focused state
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor), // Main color for enabled state
        ),
      ),
         elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, 
          
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60.0), // Padding
          textStyle: const TextStyle(color: Colors.white), // White text
          minimumSize: const Size(double.infinity, 48), // Full width
        ),
      ),
      useMaterial3: true,
    );
  }
}

