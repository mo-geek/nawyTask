import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nawytask/core/utils/handlers/size_utils.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      colorScheme: colorScheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.lightBlue800,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.lightBlue800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.teal900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900.withOpacity(0.6),
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900.withOpacity(0.6),
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.teal900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.87),
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.lightBlue800,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
      visualDensity: VisualDensity.standard,
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    background: Color(0X141638CF),
    error: Color(0X14212121),
    errorContainer: Color(0XFF7E7E7E),
    inversePrimary: Color(0X141638CF),
    inverseSurface: Color(0X14212121),
    onBackground: Color(0XFFFFFFFF),
    onError: Color(0XFFA9C6DA),
    onErrorContainer: Color(0X14212121),
    onInverseSurface: Color(0XFFA9C6DA),
    onPrimary: Color(0X14212121),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0X14212121),
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0X14212121),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0X14212121),
    outline: Color(0X14212121),
    outlineVariant: Color(0X141638CF),
    primary: Color(0XFFA9C6DA),
    primaryContainer: Color(0X141638CF),
    scrim: Color(0X141638CF),
    secondary: Color(0X141638CF),
    secondaryContainer: Color(0XFFC4C4C4),
    shadow: Color(0X14212121),
    surface: Color(0X141638CF),
    surfaceTint: Color(0X14212121),
    surfaceVariant: Color(0XFFC4C4C4),
    tertiary: Color(0X141638CF),
    tertiaryContainer: Color(0XFFC4C4C4),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
  // BlueGray
  Color get blueGray400 => Color(0XFF888888);
  // Cyan
  Color get cyan700 => Color(0XFF01A299);
  // Gray
  Color get gray100 => Color(0XFFF6F6F6);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray700 => Color(0XFF545A60);
  // LightBlue
  Color get lightBlue800 => Color(0XFF0179CB);
  // Orange
  Color get orangeA700 => Color(0XFFFF5E00);
  // Teal
  Color get teal900 => Color(0XFF0C314E);
  Color get tealA400 => Color(0XFF03DAC5);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();