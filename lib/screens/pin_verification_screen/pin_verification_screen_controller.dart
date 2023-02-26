import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:vault/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class PinVerificationScreenController {
  final Function() setstate;
  final BuildContext context;

  PinVerificationScreenController({
    required this.setstate,
    required this.context,
  });

  String pin = "";

  void enterPin(value) {
    pin += value;

    setstate();

    if (pin.length == 4 && pin == prefs.getString("userPin")) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountsScreenView(),
          ),
        ),
      );
    }
  }

  void removePin() {
    pin = pin.substring(0, pin.length - 1);

    setstate();
  }
}
