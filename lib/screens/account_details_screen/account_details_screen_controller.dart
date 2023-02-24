import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/accounts_screen/accounts_screen_controller.dart';
import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountDetailsScreenController {
  final Function() setstate;
  final BuildContext context;
  final AccountsScreenController accountsScreenController;

  AccountDetailsScreenController({
    required this.setstate,
    required this.context,
    required this.accountsScreenController,
  });

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void setAccountData({required AccountItem accountItem}) {
    username.text = accountItem.accountItemUsername;
    password.text = accountItem.accountItemPassword;
  }

  Future<void> updateAccountItem({required AccountItem accountItem}) async {
    if (username.text.isEmpty || password.text.isEmpty) return;

    accountItem.accountItemUsername = username.text;
    accountItem.accountItemPassword = password.text;

    await AccountService().updateAccountItem(accountItem: accountItem);

    await accountsScreenController.queryAccountItem();

    Navigator.pop(context);
  }

  Future<void> deleteAccountItem({required AccountItem accountItem}) async {
    await AccountService().deleteAccountItem(accountItem: accountItem);

    await accountsScreenController.queryAccountItem();

    Navigator.pop(context);
  }
}
