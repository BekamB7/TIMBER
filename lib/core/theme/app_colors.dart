import 'package:flutter/material.dart';

/// Timber's dark wood color palette.
/// All colors live here so we never hardcode hex values in widgets.
abstract class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF1A1410); // dark walnut
  static const Color surface = Color(0xFF241C16);    // wood grain
  static const Color card = Color(0xFF2E241C);       // raised wood
  static const Color elevated = Color(0xFF3A2E23);   // higher lift

  // Accents
  static const Color primary = Color(0xFFC8A97E);    // warm oak
  static const Color secondary = Color(0xFF8B6F47);  // deep bark

  // Text
  static const Color textPrimary = Color(0xFFF5EDE4); // cream
  static const Color textMuted = Color(0xFFA89684);   // ash
  static const Color textDim = Color(0xFF6E5F50);     // faded

  // Semantic
  static const Color danger = Color(0xFFC25B4E);      // rust
  static const Color success = Color(0xFF7A9B6E);     // moss
  static const Color warning = Color(0xFFD4A24C);     // amber

  // Utility
  static const Color divider = Color(0xFF3A2E23);
  static const Color overlay = Color(0x99000000);
}
