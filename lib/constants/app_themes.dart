import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData theme01 = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: color02,
    onPrimary: color04,
    secondary: color02,
    onSecondary: color04,
    error: color02,
    onError: color04,
    background: color01,
    onBackground: color04,
    surface: color02,
    onSurface: color04,
  ),
  scaffoldBackgroundColor: color01,
  fontFamily: "Montserrat",
  snackBarTheme: SnackBarThemeData(
    backgroundColor: color02,
    contentTextStyle: TextStyle(
      color: color04,
      fontSize: 17.sp,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    behavior: SnackBarBehavior.floating,
  ),
);
