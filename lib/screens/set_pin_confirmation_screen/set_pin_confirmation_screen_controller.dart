import 'package:vault/screens/accounts_screen/accounts_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:vault/services/shared_preferences_service.dart';
import 'package:vault/shared/shared_snackbar.dart';

class SetPinConfirmationScreenController {
  final Function() setstate;
  final BuildContext context;

  SetPinConfirmationScreenController({
    required this.setstate,
    required this.context,
  });

  String pin = "";
  String pinConfirm = "";

  Future<void> enterPinConfirm(value) async {
    if (pinConfirm.length < 4) pinConfirm += value;

    setstate();

    if (pinConfirm.length == 4) {
      if (pinConfirm == pin) {
        await prefs.setBool("hasUser", true);
        await prefs.setString("userPin", pin);

        Future.delayed(
          const Duration(milliseconds: 1500),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AccountsScreenView(),
            ),
          ),
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 750),
          () {
            pinConfirm = "";

            showSharedSnackbar(
              context: context,
              content: const Text("Pin does not match"),
            );

            setstate();
          },
        );
      }
    }
  }

  void removePinConfirm() {
    pinConfirm = pinConfirm.substring(0, pinConfirm.length - 1);

    setstate();
  }
}
