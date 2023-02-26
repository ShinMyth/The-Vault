import 'package:vault/screens/pin_verification_screen/pin_verification_screen_view.dart';
import 'package:vault/screens/set_pin_screen/set_pin_screen_view.dart';
import 'package:vault/services/shared_preferences_service.dart';
import 'package:vault/services/sqflite_database_service.dart';
import 'package:flutter/material.dart';

class SplashScreenController {
  final Function() setstate;
  final BuildContext context;

  SplashScreenController({
    required this.setstate,
    required this.context,
  });

  Future<void> initializeSqfliteDatabase() async {
    await SqfliteDatabaseService().initializeSqfliteDatabase();

    await initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await SharedPreferencesService().initializeSharedPreferences();

    Future.delayed(
      const Duration(milliseconds: 2500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => prefs.getBool("hasUser") == true
              ? const PinVerificationScreenView()
              : const SetPinScreenView(),
        ),
      ),
    );
  }
}
