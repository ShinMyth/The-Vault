import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountsScreenController {
  final Function() setstate;
  final BuildContext context;

  AccountsScreenController({
    required this.setstate,
    required this.context,
  });

  Future<void> queryAccountItem() async {
    await AccountService().queryAccountItem();
    setstate();
  }
}
