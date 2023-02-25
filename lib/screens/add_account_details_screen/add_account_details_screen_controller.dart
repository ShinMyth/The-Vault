import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';

class AddAccountDetailsScreenController {
  final Function() setstate;
  final BuildContext context;
  final AccountsScreenController accountsScreenController;

  AddAccountDetailsScreenController({
    required this.setstate,
    required this.context,
    required this.accountsScreenController,
  });

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertAccountItem({required AccountItem accountItem}) async {
    if (username.text.isEmpty || password.text.isEmpty) return;

    accountItem.accountItemUsername = username.text;
    accountItem.accountItemPassword = password.text;

    await AccountService().insertAccountItem(accountItem: accountItem);

    await accountsScreenController.queryAccountItem();

    Navigator.pop(context);
    Navigator.pop(context);
  }
}
