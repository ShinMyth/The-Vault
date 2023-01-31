import 'package:vault/models/account_item_model.dart';
import 'package:flutter/material.dart';
import 'package:vault/services/account_service.dart';

class AddAccountDetailsScreenController {
  final Function() setstate;
  final BuildContext context;

  AddAccountDetailsScreenController({
    required this.setstate,
    required this.context,
  });

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertAccountItem({required AccountItem accountItem}) async {
    if (username.text.isEmpty || password.text.isEmpty) return;

    accountItem.accountItemUsername = username.text;
    accountItem.accountItemPassword = password.text;

    await AccountService().insertAccountItem(accountItem: accountItem);

    Navigator.pop(context);
    Navigator.pop(context);
  }
}
