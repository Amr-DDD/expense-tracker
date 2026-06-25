import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 144, 0),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 33, 39, 77),
);

final ThemeData _lightTheme = ThemeData(
  colorScheme: kColorScheme,
  scaffoldBackgroundColor: kColorScheme.secondaryContainer,
  appBarTheme: AppBarTheme(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: CardThemeData(
    color: kColorScheme.primaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.secondaryContainer,
      foregroundColor: kColorScheme.onSecondaryContainer,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: kColorScheme.onPrimaryContainer, fontSize: 14),
    titleLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: kColorScheme.onPrimaryContainer,
      fontSize: 24,
    ),
  ),
);

final ThemeData _darkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: kDarkColorScheme.secondaryContainer,
    foregroundColor: kDarkColorScheme.onSecondaryContainer,
  ),
  cardTheme: CardThemeData(
    color: kColorScheme.primaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: kDarkColorScheme.onPrimaryContainer,
      fontSize: 14,
    ),
    titleLarge: const TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.secondaryContainer,
      foregroundColor: kDarkColorScheme.onSecondaryContainer,
    ),
  ),
);

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: _darkTheme,
      theme: _lightTheme,
      home: const Expenses(),
    ),
  );
}
