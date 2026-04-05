import 'package:flutter/material.dart';

class AppColors {
  // --- Core Colors ---
  static const Color primary = Color(0xFF6EC4A1);
  static const Color primaryDisabled = Color(0xFF35584A);
  static const Color secondary = Color(0xFF5ED5A8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFDD4B4B);
  static const Color danger = Color(0xFFDD4B4B);

  // --- Backgrounds & Surfaces ---
  static const Color darkBackground = Color(0xFF1B232A);
  static const Color coinDetailsBackground = Color(0xFF0B0E11);
  static const Color primaryGreen = Color(0xFF00C076);
  static const Color errorRed = Color(0xFFFF3B30);
  static const Color darkSurface = Color(0xFF212931);
  static const Color lightBackground = Color(0xFFF1F4F6);
  static const Color grey = Color(0xFF777777);
  static const Color lightGrey = Color(0xFFC1C7CD);

  // --- UI Accents ---
  static const Color blue = Color(0xFF0033AD);
  static const Color red = Color(0xFFDD4B4B);
  static const Color orange = Color(0xFFFCBD68);
  static const Color skyBlue = Color(0xFF4AA8FF);
  static const Color warning = Color(0xFFF7931A);
  static const Color success = Color(0xFF34A853);

  // --- Teal Gradient Shades ---
  static const Color teal1 = Color(0xFF256E6E);
  static const Color teal2 = Color(0xFF2F8E8E);
  static const Color teal3 = Color(0xFF3AAEAE);
  static const Color teal4 = Color(0xFF4FC4C4);
  static const Color teal5 = Color(0xFF6FCFCF);
  static const Color teal6 = Color(0xFF8FDADA);
  static const Color teal7 = Color(0xFFAFE4E4);
  static const Color teal8 = Color(0xFFD0EFEF);
  static const Color teal9 = Color(0xFFF0FAFA);

  // --- Colors with Opacity ---
  static const Color primary25 = Color(0x405ED5A8);
  static const Color primary10 = Color(0x1A5ED5A8);
  static const Color error16 = Color(0x29DD4B4B);
  static const Color overlay50 = Color(0x80161C22);

  // --- Skeleton Colors ---
  static const Color skeletonBase = Color(0xFF262F36);
  static const Color skeletonHighlight = Color(0xFF333E47);

  // --- Premium UI Colors ---
  static const Color neonGreen = Color(0xFF00FF99);
  static const Color neonRed = Color(0xFFFF3B30);
  static const Color glassWhite = Color(0x0DFFFFFF); // Lowered from 0x1A
  static const Color glassBorder = Color(0x1AFFFFFF); // Lowered from 0x33
  static const Color deepBlueBlack = Color(0xFF0D1117);
  static const Color deepBlack = Color(0xFF010409);

  static const LinearGradient premiumGradient = LinearGradient(
    begin: Alignment.topCenter, // Changed to topCenter for a more balanced look
    end: Alignment.bottomCenter,
    colors: [darkBackground, coinDetailsBackground, deepBlack],
  );
}
