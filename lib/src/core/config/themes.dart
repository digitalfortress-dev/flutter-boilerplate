import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/gen/fonts.gen.dart';

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
    background: ColorName.background,
    error: ColorName.error,
    onPrimary: ColorName.onPrimary,
    onSecondary: ColorName.onSecondary,
    onSurface: ColorName.onSurface,
    onBackground: ColorName.onBackground,
    onError: ColorName.onError,
    brightness: Brightness.light,
  );

  static final ThemeData lightTheme = ThemeData(
      fontFamily: FontFamily.muli,
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      checkboxTheme:
          const CheckboxThemeData(side: BorderSide(color: Colors.white)),
      backgroundColor: Colors.white,
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
      textTheme: _buildTextTheme());
}

TextTheme _buildTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w900,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
      color: Colors.black87,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w700,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Colors.black45,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    overline: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
