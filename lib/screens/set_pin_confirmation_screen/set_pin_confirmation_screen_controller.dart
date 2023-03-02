import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:vault/services/shared_preferences_service.dart';
import 'package:vault/shared/shared_loading.dart';
import 'package:vault/shared/shared_snackbar.dart';
import 'package:flutter/material.dart';

class SetPinConfirmationScreenController {
  final Function() setstate;
  final BuildContext context;

  SetPinConfirmationScreenController({
    required this.setstate,
    required this.context,
  });

  String pin = "";
  String confirmPin = "";

  Future<void> enterConfirmPin(value) async {
    if (confirmPin.length < 4) {
      confirmPin += value;
    }

    setstate();

    if (confirmPin.length == 4) {
      showSharedLoading(context: context);

      if (confirmPin == pin) {
        await prefs.setBool("hasUser", true);
        await prefs.setString("userPin", pin);

        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountsScreenView(),
              ),
            );
          },
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pop(context);

            confirmPin = "";

            setstate();

            showSharedSnackbar(
              context: context,
              content: const Text("Pin does not match."),
            );
          },
        );
      }
    }
  }

  void removeConfirmPin() {
    if (confirmPin.isNotEmpty) {
      confirmPin = confirmPin.substring(0, confirmPin.length - 1);
    }

    setstate();
  }
}
