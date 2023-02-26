import 'package:vault/screens/set_pin_confirmation_screen/set_pin_confirmation_screen_view.dart';
import 'package:flutter/material.dart';

class SetPinScreenController {
  final Function() setstate;
  final BuildContext context;

  SetPinScreenController({
    required this.setstate,
    required this.context,
  });

  String pin = "";

  void enterPin(value) {
    pin += value;

    setstate();

    if (pin.length == 4) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SetPinConfirmationScreenView(
              pin: pin,
            ),
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
