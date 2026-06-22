import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 144, 0),
);

var kdarkColorScheme = ColorScheme.fromSeed(
  brightness:
      Brightness.dark, // deh bt5lyh y5tar dark color shades xD mohma fsh5
  seedColor: const Color.fromARGB(255, 33, 39, 77),
);

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //    onValue,
  //  ) {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system, // switch between light/dark/system mode
      darkTheme: ThemeData.dark().copyWith(
        // this time we used copyWith() 3lshan l dark() leha colorSceheme gahez
        colorScheme: kdarkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kdarkColorScheme.secondaryContainer,
          foregroundColor: kdarkColorScheme.onSecondaryContainer,
          //titleTextStyle: TextStyle(color: kdarkColorScheme.onSecondaryContainer)
        ),
        cardTheme: CardThemeData(
          color: kdarkColorScheme.primaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),

        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: kdarkColorScheme.onPrimaryContainer,
            fontSize: 14,
          ),
          titleLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkColorScheme.secondaryContainer,
            foregroundColor: kdarkColorScheme.onSecondaryContainer,
          ),
        ),
      ),

      theme: ThemeData(
        colorScheme: kcolorScheme,
        scaffoldBackgroundColor: kcolorScheme.secondaryContainer,
        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer,
          // titleTextStyle: TextStyle(color: kcolorScheme.primaryContainer)
        ),
        cardTheme: CardThemeData(
          color: kcolorScheme.primaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.secondaryContainer,
            foregroundColor: kcolorScheme.onSecondaryContainer,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: kcolorScheme.onPrimaryContainer,
            fontSize: 14,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kcolorScheme
                .onPrimaryContainer, // NOTE: this won't be applied because we had set the appbar theme's foreground text color
            // (which will override the )
            fontSize: 24,
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(textStyle: TextStyle()),
      ),

      //ThemeData(useMaterial3: true),   <-- bysta5dm material 3 lel theme bs ana 3ndy byst5dmo by default
      home: const Expenses(),
    ),
  );
  //  });
}
