import 'package:vault/constants/app_colors.dart';
import 'package:flutter/material.dart';

showSharedSnackbar({
  required BuildContext context,
  required Widget content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      backgroundColor: color02,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
    ),
  );
}
