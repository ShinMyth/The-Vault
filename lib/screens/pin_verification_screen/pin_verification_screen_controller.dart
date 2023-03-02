import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vault/constants/app_colors.dart';
import 'package:vault/screens/home_screen/home_screen_view.dart';
import 'package:vault/services/shared_preferences_service.dart';
import 'package:vault/shared/shared_loading.dart';
import 'package:vault/shared/shared_snackbar.dart';
import 'package:flutter/material.dart';

class PinVerificationScreenController {
  final Function() setstate;
  final BuildContext context;

  PinVerificationScreenController({
    required this.setstate,
    required this.context,
  });

  String pin = "";

  Future<void> enterPin(value) async {
    if (pin.length < 4) {
      pin += value;
    }

    setstate();

    if (pin.length == 4) {
      showSharedLoading(context: context);

      if (pin == prefs.getString("userPin")) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreenView(),
              ),
            );
          },
        );
      } else {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            Navigator.pop(context);

            pin = "";

            setstate();

            showSharedSnackbar(
              context: context,
              content: Text(
                "Wrong pin.",
                style: TextStyle(
                  color: color04,
                  fontSize: 17.sp,
                ),
              ),
            );
          },
        );
      }
    }
  }

  void removePin() {
    if (pin.isNotEmpty) {
      pin = pin.substring(0, pin.length - 1);
    }

    setstate();
  }
}
