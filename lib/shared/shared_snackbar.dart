import 'package:flutter/material.dart';

showSharedSnackbar({
  required BuildContext context,
  required Widget content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      duration: const Duration(milliseconds: 1000),
    ),
  );
}
