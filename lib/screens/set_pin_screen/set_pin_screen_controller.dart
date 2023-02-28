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
    if (pin.length < 4) {
      pin += value;
    }

    setstate();
  }

  void removePin() {
    if (pin.isNotEmpty) {
      pin = pin.substring(0, pin.length - 1);
    }

    setstate();
  }
}
