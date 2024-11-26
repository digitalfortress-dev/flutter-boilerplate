import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/colors.gen.dart';
import 'package:flutter_boilerplate/generated/fonts.gen.dart';

class Themes {
  Themes._();

  // static const linearGradient = LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: [
  //     Color(0xFFFCBF1E),
  //     Color(0xFFFC7936),
  //     Color(0xFFFC663D),
  //     Color(0xFFFC6446),
  //   ],
  //   stops: [0.0, -0.141, 0.5571, 1.1415],
  // ); // * Open this code if you need

  static const colorScheme = ColorScheme(
    primary: ColorName.primary,
    secondary: ColorName.secondary,
    surface: ColorName.surface,
    error: ColorName.error,
    onPrimary: ColorName.onPrimary,
    onSecondary: ColorName.onSecondary,
    onSurface: ColorName.onSurface,
    onError: ColorName.onError,
    brightness: Brightness.light,
  );

  static final ThemeData lightTheme = ThemeData(
      fontFamily: FontFamily.muli,
      primaryColor: colorScheme.primary,
      checkboxTheme:
          const CheckboxThemeData(side: BorderSide(color: Colors.white)),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: colorScheme.primary,
        selectedLabelStyle: TextStyle(
          color: colorScheme.primary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: const Color(0xFFA4A4A4),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFFA4A4A4),
          fontSize: 14,
        ),
        type: BottomNavigationBarType.fixed,
      ),
      splashColor: colorScheme.primary.withOpacity(0.26),
      disabledColor: const Color(0xFFA4A4A4),
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      textTheme: _buildTextTheme(),
      colorScheme: colorScheme.copyWith(surface: Colors.white));
}

TextTheme _buildTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
      color: Colors.black87,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Colors.black45,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
