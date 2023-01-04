import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:flutter/material.dart';

class SignInScreenController {
  final Function() setstate;
  final BuildContext context;

  SignInScreenController({required this.setstate, required this.context});

  String pin = "";

  void enterPin(value) {
    pin += value;

    setstate();

    if (pin.length == 4) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AccountsScreenView()),
        );
      });
    }
  }
}
