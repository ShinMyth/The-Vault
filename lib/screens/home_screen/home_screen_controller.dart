import 'package:vault/services/account_service.dart';
import 'package:flutter/material.dart';

class HomeScreenController {
  final Function() setstate;
  final BuildContext context;

  HomeScreenController({
    required this.setstate,
    required this.context,
  });

  Future<void> queryAccountItem() async {
    await AccountService().queryAccountItem();
    setstate();
  }
}
