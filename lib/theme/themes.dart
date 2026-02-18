import 'package:flutter/material.dart';
import 'package:rep_count/theme/color_palette.dart';

ThemeData lightTheme = ThemeData(

    primaryColor: Colors.white,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        labelLarge: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black),
        labelSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black)),

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    listTileTheme: ListTileThemeData(
        tileColor: ColorPalette.lightSecondaryColor,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            foregroundColor: WidgetStatePropertyAll(ColorPalette.blackColor),
            iconSize: WidgetStatePropertyAll(18.0)
        ),
    )
);

ThemeData lightIconTheme = ThemeData(
    iconTheme: IconThemeData(
        color: Colors.black,
        size: 32.0
    )
);

