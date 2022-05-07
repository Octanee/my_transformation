import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color indigo = const Color.fromARGB(255, 70, 0, 140);
  static Color electricIndigo = const Color.fromARGB(255, 110, 0, 220);
  static Color cultured = const Color.fromARGB(255, 242, 242, 242);
  static Color roseMadder = const Color.fromARGB(255, 220, 45, 60);

  static final theme = ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(textTheme),
    appBarTheme: appBarTheme,
    colorScheme: colorScheme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: cultured,
  );

  static const inputDecorationTheme = InputDecorationTheme(
    border: InputBorder.none,
  );

  static final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: indigo,
    onPrimary: cultured,
    secondary: Colors.grey,
    onSecondary: Colors.blueGrey,
    error: Colors.red,
    onError: Colors.blue,
    background: Colors.green,
    onBackground: Colors.yellow,
    surface: Colors.cyan,
    onSurface: Colors.indigo,
  );

  static const textTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 22,
    ),
    bodyText2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );

  static const appBarTheme = AppBarTheme(
    centerTitle: true,
  );

  static final appGradient = RadialGradient(
    colors: [indigo, electricIndigo],
    stops: [1, 1],
  );
}
