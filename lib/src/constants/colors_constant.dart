import 'dart:ui';

// Cores para o tema claro do aplicativo
sealed class LightColorsConstants {
  static const Color primary = Color(0xFFEFF0F2);
  static const Color secondary = Color(0xFFE0E0E0);
  static const Color onPrimary = Color(0xFF191D23);
  static const Color onSecondary = Color(0xFF6A6D72);
  static const Color alert = Color(0xFFA83930);
}

// Cores para o tema escuro do aplicativo
sealed class DarkColorsConstants {
  static const Color primary = Color(0xFF191D23);
  static const Color secondary = Color(0xFF343940);
  static const Color onPrimary = Color(0xFFEFF0F2);
  static const Color onSecondary = Color(0xFF9EA0A3);
  static const Color alert = Color(0xFFC6989E);
}
