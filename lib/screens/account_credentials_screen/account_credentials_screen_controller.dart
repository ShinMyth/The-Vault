import 'package:vault/models/account_item_model.dart';
import 'package:vault/screens/home_screen/home_screen_controller.dart';
import 'package:vault/services/account_service.dart';
import 'package:vault/shared/shared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountCredentialsScreenController {
  final Function() setstate;
  final BuildContext context;

  AccountCredentialsScreenController({
    required this.setstate,
    required this.context,
  });

  late AccountItem accountItem;
  late HomeScreenController homeScreenController;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordObscureText = true;

  void changeIsPasswordObscureText() {
    isPasswordObscureText = !isPasswordObscureText;
    setstate();
  }

  Future<void> insertAccountItem() async {
    if (username.text.isEmpty || password.text.isEmpty) return;

    bool result = await showSharedDialog(
          context: context,
          barrierDismissible: true,
          title: Text(
            "Add Account",
            style: TextStyle(
              fontSize: 17.5.sp,
            ),
          ),
          content: Text(
            "Do you want to add this account?",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          actionFunction1: () => Navigator.pop(context, false),
          actionLabel1: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
          actionFunction2: () => Navigator.pop(context, true),
          actionLabel2: Text(
            "Add",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
        ) ??
        false;

    if (!result) return;

    accountItem.accountItemUsername = username.text;
    accountItem.accountItemPassword = password.text;

    await AccountService().insertAccountItem(accountItem: accountItem);

    await homeScreenController.queryAccountItem();

    Navigator.pop(context);
    Navigator.pop(context);
  }

  Future<void> updateAccountItem() async {
    if (username.text.isEmpty || password.text.isEmpty) return;

    bool result = await showSharedDialog(
          context: context,
          barrierDismissible: true,
          title: Text(
            "Update Account",
            style: TextStyle(
              fontSize: 17.5.sp,
            ),
          ),
          content: Text(
            "Do you want to update this account?",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          actionFunction1: () => Navigator.pop(context, false),
          actionLabel1: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
          actionFunction2: () => Navigator.pop(context, true),
          actionLabel2: Text(
            "Update",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
        ) ??
        false;

    if (!result) return;

    accountItem.accountItemUsername = username.text;
    accountItem.accountItemPassword = password.text;

    await AccountService().updateAccountItem(accountItem: accountItem);

    await homeScreenController.queryAccountItem();

    Navigator.pop(context);
  }

  Future<void> deleteAccountItem() async {
    bool result = await showSharedDialog(
          context: context,
          barrierDismissible: true,
          title: Text(
            "Delete Account",
            style: TextStyle(
              fontSize: 17.5.sp,
            ),
          ),
          content: Text(
            "Do you want to delete this account?",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          actionFunction1: () => Navigator.pop(context, false),
          actionLabel1: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
          actionFunction2: () => Navigator.pop(context, true),
          actionLabel2: Text(
            "Delete",
            style: TextStyle(
              fontSize: 16.5.sp,
            ),
          ),
        ) ??
        false;

    if (!result) return;

    await AccountService().deleteAccountItem(accountItem: accountItem);

    await homeScreenController.queryAccountItem();

    Navigator.pop(context);
  }
}
